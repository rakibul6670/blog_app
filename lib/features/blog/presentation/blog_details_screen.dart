import 'package:blog_app/features/blog/model/blog_post_model.dart';
import 'package:blog_app/features/blog/widgets/write_comment_secton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/blog_and_blogger_details.dart';
import '../widgets/comment_card.dart';

class BlogDetailsScreen extends StatelessWidget {
  final BlogPostModel blogs;

  const BlogDetailsScreen({super.key, required this.blogs});

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
              blogs.isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              size: 25,
            ),
          ),
        ],
      ),

      //======================= Body Section ========================
      body: SafeArea(
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
                        blogs.featuredImage,
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
                            blogs.title,
                            //maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 16.h),

                          //====================== Blogger Profile ====================
                          BlogAndBloggerDetails(blogs: blogs),

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
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return CommentCard();
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
            WriteCommentSecton(),
          ],
        ),
      ),
    );
  }
}
