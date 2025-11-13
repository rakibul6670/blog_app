import 'package:blog_app/common_widgets/custom_loading_progress.dart';
import 'package:blog_app/features/blog/model/blog_comment_model.dart';
import 'package:blog_app/features/blog/model/blog_post_model.dart';
import 'package:blog_app/features/blog/model/pagination_model.dart';
import 'package:blog_app/features/blog/widgets/write_comment_secton.dart';
import 'package:blog_app/provider/comments_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../widgets/blog_and_blogger_details.dart';
import '../widgets/comment_card.dart';

class BlogDetailsScreen extends StatefulWidget {
  final BlogPostModel blogs;
  final PaginationModel pagination;

  const BlogDetailsScreen({
    super.key,
    required this.blogs,
    required this.pagination,
  });

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  //======================== Init State ==========
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await (context).read<CommentsProvider>().getAllCommentsMethod(
        widget.blogs.id,
        widget.pagination.currentPage,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //======================== App Bar Section ===============
      appBar: AppBar(
        actions: [
          //--------- Bookmark button --------------
          IconButton(
            onPressed: () {
              // toggle book mark fucntion ekhane dibo
            },
            icon: Icon(
              widget.blogs.isBookmarked
                  ? Icons.bookmark
                  : Icons.bookmark_outline,
              size: 25,
            ),
          ),
        ],
      ),

      //======================= Body Section ========================
      body: SafeArea(
        child: Consumer<CommentsProvider>(
          builder: (context, comment, child) {
            return RefreshIndicator(
              onRefresh: () => comment.getAllCommentsMethod(
                widget.blogs.id,
                widget.pagination.currentPage,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Column(
                        children: [
                          //-------------------- Featured Image Section ---------------
                          SizedBox(
                            height: 320.h,
                            width: double.infinity,
                            child: Image.network(
                              widget.blogs.featuredImage,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 50,
                                    color: Colors.grey[400],
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(height: 20.h),

                          //========================= Blog Content Section =================
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //---------------- Blog Title -------------
                                Text(
                                  widget.blogs.title,
                                  //maxLines: 1,
                                  // overflow: TextOverflow.ellipsis,
                                  style: textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: 16.h),

                                //====================== Blogger Profile ====================
                                BlogAndBloggerDetails(blogs: widget.blogs),

                                SizedBox(height: 24.h),

                                //==================================== Comment Section ================
                                Text(
                                  "Comments",
                                  style: textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(height: 16.h),

                                //---------------------- Comment List ---------
                                comment.isCommentLoading
                                    ? CustomLoadingProgress()
                                    : comment.pageCommentList.isEmpty
                                    ? Center(child: Text("Comment not yet!"))
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            comment.pageCommentList.length,
                                        itemBuilder: (context, index) {
                                          final commentMap =
                                              comment.pageCommentList[index];

                                          return CommentCard(
                                            commentModel: commentMap,
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(height: 16);
                                        },
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //==================== Write Comment Section ================
                  WriteCommentSecton(postId: widget.blogs.id, parentId: 0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
