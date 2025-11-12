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

                          // Row(
                          //   children: [
                          //     Text(
                          //       "Comments",
                          //       style: textTheme.titleLarge?.copyWith(
                          //         fontWeight: FontWeight.w600,
                          //       ),
                          //     ),
                          //     SizedBox(width: 8.w),

                          //     // ---------------- Comment count badge
                          //     Container(
                          //       padding: EdgeInsets.symmetric(
                          //         horizontal: 8.w,
                          //         vertical: 2.h,
                          //       ),
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(12),
                          //       ),
                          //       child: Text(
                          //         blogs.commentCount.toString(),
                          //         style: textTheme.bodySmall?.copyWith(
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
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

  // Widget _buildCommentList() {
  //   // TODO: Replace with actual comments data
  //   if (blogs.commentCount == 0) {
  //     return Padding(
  //       padding: EdgeInsets.symmetric(vertical: 32.h),
  //       child: Column(
  //         children: [
  //           Icon(Icons.chat_bubble_outline, size: 48, color: Colors.grey),
  //           SizedBox(height: 8.h),
  //           Text(
  //             "No comments yet",
  //             style: TextStyle(color: Colors.grey),
  //           ),
  //           SizedBox(height: 4.h),
  //           Text(
  //             "Be the first to comment!",
  //             style: TextStyle(color: Colors.grey, fontSize: 12),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   return ListView.separated(
  //     shrinkWrap: true,
  //     physics: NeverScrollableScrollPhysics(),
  //     itemCount: min(blogs.commentCount, 10), // Limit initial display
  //     itemBuilder: (context, index) {
  //       return CommentCard();
  //     },
  //     separatorBuilder: (context, index) {
  //       return SizedBox(height: 16.h);
  //     },
  //   );
  // }

  // Widget _buildCommentInput() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).colorScheme.surface,
  //       border: Border(
  //         top: BorderSide(
  //           color: Theme.of(context).dividerColor,
  //           width: 1,
  //         ),
  //       ),
  //     ),
  //     child: Row(
  //       children: [
  //         // User avatar
  //         CircleAvatar(
  //           radius: 20.r,
  //           backgroundColor: Colors.orange,
  //           // TODO: Replace with actual user avatar
  //           child: Text(
  //             "U",
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),

  //         SizedBox(width: 12.w),

  //         // Comment input field
  //         Expanded(
  //           child: TextFormField(
  //             decoration: InputDecoration(
  //               hintText: "Write your comment...",
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(25),
  //                 borderSide: BorderSide.none,
  //               ),
  //               filled: true,
  //               fillColor: Theme.of(context).colorScheme.surfaceVariant,
  //               contentPadding: EdgeInsets.symmetric(
  //                 horizontal: 16.w,
  //                 vertical: 12.h,
  //               ),
  //               suffixIcon: IconButton(
  //                 onPressed: () {
  //                   // TODO: Implement send comment functionality
  //                   _sendComment();
  //                 },
  //                 icon: Icon(Icons.send, color: Colors.green),
  //               ),
  //             ),
  //             minLines: 1,
  //             maxLines: 3,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _toggleBookmark() {
  //   // TODO: Implement bookmark toggle logic
  // }

  // void _sendComment() {
  //   // TODO: Implement send comment logic
  // }
}

// import 'package:blog_app/features/blog/model/blog_post_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../widgets/blog_and_blogger_details.dart';
// import '../widgets/comment_card.dart';

// class BlogDetailsScreen extends StatelessWidget {
//   final BlogPostModel blogs;

//   const BlogDetailsScreen({super.key, required this.blogs});

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       //======================== App Bar Section ===============
//       appBar: AppBar(
//         //----------- Save Icon -----
//         actions: [
//           GestureDetector(
//             onTap: () {},
//             child: Icon(Icons.bookmark_outline_sharp, size: 25),
//           ),
//           //-----------space
//           SizedBox(width: 16.h),
//         ],
//       ),

//       //======================= Body Section ========================
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               //-------------------- image Section ---------------
//               SizedBox(
//                 height: 320.h,
//                 width: 390.w,
//                 child: Image.network(
//                   blogs.featuredImage??
//                   "",
//                   fit: BoxFit.fill,
//                   errorBuilder: (contet, error, StackTrace) {
//                     return Icon(Icons.image_not_supported);
//                   },
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               //========================= Blog Section =================
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     //---------------- title -------------
//                     Text(
//                       blogs.title,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: textTheme.titleLarge,
//                     ),

//                     SizedBox(height: 12.h),

//                     //======================  blogger profile ====================-
//                     BlogAndBloggerDetails(blogs: blogs),

//                     SizedBox(height: 16.h),
//                     //==================================== Comment Section ================
//                     Text(
//                       "Comments",
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: textTheme.titleMedium,
//                     ),

//                     //---------------------- Comment List ---------
//                     SizedBox(height: 16.h),

//                     ListView.separated(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: 10,
//                       itemBuilder: (context, index) {
//                         return CommentCard();
//                       },
//                       separatorBuilder: (context, index) {
//                         return SizedBox(height: 16);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       //==================== write comment section ================
//       bottomNavigationBar: WriteCommentSecton(),
//     );
//   }
// }
