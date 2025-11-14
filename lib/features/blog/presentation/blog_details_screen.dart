import 'package:blog_app/common_widgets/custom_loading_progress.dart';
import 'package:blog_app/features/blog/widgets/blog_and_blogger_details.dart';
import 'package:blog_app/features/blog/widgets/comment_card.dart';
import 'package:blog_app/features/blog/widgets/write_comment_secton.dart';
import 'package:blog_app/provider/all_blog_post_provider.dart';
import 'package:blog_app/provider/all_comments_provider.dart';
import 'package:blog_app/provider/single_blog_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BlogDetailsScreen extends StatefulWidget {
  final int id;
  final int currentPage;

  const BlogDetailsScreen({
    super.key,
    required this.id,
    required this.currentPage,
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
      await (context).read<SingleBlogPostProvider>().getSinglePost(widget.id);
      await (context).read<AllCommentProvider>().getAllCommentMethod(
        widget.id,
        // 1,
        widget.currentPage,
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
            icon: Icon(Icons.bookmark_outline, size: 25),
          ),
        ],
      ),

      //======================= Body Section ========================
      body: SafeArea(
        child: Consumer3<SingleBlogPostProvider, AllBlogPostsProvider, AllCommentProvider>(
          builder: (context, singlePost, allPost, allCommentProvider, child) {
            //------------- loading progress show ---------
            if (singlePost.isLoadingProgress) {
              return CustomLoadingProgress();
            }

            //----------- null and error check --------
            if (singlePost.singleBlogPostModel == null) {
              return Center(
                child: Text(
                  singlePost.postLoadMessage.isNotEmpty
                      ? "No post found"
                      : singlePost.postLoadMessage,
                ),
              );
            }

            //---------------- Success State
            return RefreshIndicator(
              onRefresh: () async {
                await singlePost.getSinglePost(widget.id);
                await allCommentProvider.getAllCommentMethod(
                  widget.id,
                  widget.currentPage,
                );
              },
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
                              singlePost.singleBlogPostModel?.featuredImage ??
                                  "",
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
                                  singlePost.singleBlogPostModel?.title ??
                                      "unknown",
                                  //maxLines: 1,
                                  // overflow: TextOverflow.ellipsis,
                                  style: textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: 16.h),

                                //====================== Blogger Profile ====================
                                BlogAndBloggerDetails(postId: widget.id),
                                SizedBox(height: 24.h),

                                //==================================== Comment Section  ================
                                Text(
                                  "Comments",
                                  style: textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(height: 16.h),

                                //---------------------- Comment List ---------
                                allCommentProvider.isCommentGetLoading
                                    ? CustomLoadingProgress()
                                    : allCommentProvider.allCommentList.isEmpty
                                    ? Text(
                                        "No Comment",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: allCommentProvider
                                            .allCommentList
                                            .length,
                                        itemBuilder: (context, index) {
                                          final commentMap = allCommentProvider
                                              .allCommentList[index];

                                          return CommentCard(
                                            commentModel: commentMap,
                                            commentProvider: allCommentProvider,
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(height: 16);
                                        },
                                      ),

                                //================== Writre comment section ==========
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // //==================== Write singlePost Section ================
                  WriteCommentSecton(
                    postId: widget.id,
                    parentId: 0,
                    pageNumber: widget.currentPage,
                    allCommentProvider: allCommentProvider,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
