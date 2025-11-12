// import 'package:blog_app/features/blog/presentation/blog_details_screen.dart';
// import 'package:blog_app/provider/blog_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:logger/web.dart';
// import 'package:provider/provider.dart';

// class BlogScreen extends StatefulWidget {
//   const BlogScreen({super.key});

//   @override
//   State<BlogScreen> createState() => _BlogScreenState();
// }

// class _BlogScreenState extends State<BlogScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() async {
//       await context.read<BlogProvider>().getAllBlog();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Blog", style: TextStyle(fontSize: 20)),
//         centerTitle: true,
//         actions: [
//           GestureDetector(onTap: () {}, child: Icon(Icons.search, size: 25)),
//           SizedBox(width: 16.h),
//         ],
//       ),
//       body: SafeArea(
//         child: Consumer<BlogProvider>(
//           builder: (context, blog, child) {
//             Logger logger = Logger();

//             // Logging blog titles and authors
//             for (var post in blog.blogList) {
//               logger.i(
//                 'Blog: ${post.title}, Author: ${post.author.name ?? "Unknown"}',
//               );
//             }

//             if (blog.blogLoading) {
//               return Center(child: CircularProgressIndicator());
//             }

//             if (blog.blogList.isEmpty) {
//               return Center(child: Text("Blog not found!"));
//             }

//             return ListView.separated(
//               itemCount: blog.blogList.length,
//               itemBuilder: (context, index) {
//                 final blogs = blog.blogList[index];

//                 return SizedBox(
//                   height: 164.h,
//                   width: 358.w,
//                   child: GestureDetector(
//                     onTap: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) => BlogDetailsScreen(blogs: blogs),
//                       //   ),
//                       // );
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.r),
//                       child: Row(
//                         children: [
//                           // Text Section
//                           Expanded(
//                             flex: 2,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Blog category
//                                 Text(
//                                   "title",
//                                   // (blogs.categories?.join(", ") ?? "Unknown"),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color(0xff9EA6BA),
//                                   ),
//                                 ),
//                                 SizedBox(height: 2.h),
//                                 // Author
//                                 Text(
//                                   "author",
//                                   // "By ${blogs.author?.name ?? "Unknown"}",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color(0xff9EA6BA),
//                                   ),
//                                 ),
//                                 SizedBox(height: 4.h),
//                                 // Blog title
//                                 Text(
//                                   "blog title",
//                                   //   blogs.title ?? "No title",
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 SizedBox(height: 4.h),
//                                 // Blog excerpt
//                                 Text(
//                                   'blog description',
//                                   // blogs.excerpt ?? "No description",
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 4,
//                                   style: TextStyle(
//                                     fontSize: 14.h,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color(0xff9EA6BA),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           SizedBox(width: 4.w),
//                           // Image Section
//                           Expanded(
//                             child: Container(
//                               height: double.infinity,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 color: Colors.blueGrey,
//                                 image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image:
//                                       blogs.featuredImage != null &&
//                                           blogs.featuredImage.isNotEmpty
//                                       ? NetworkImage(blogs.featuredImage!)
//                                       : AssetImage(
//                                               'assets/images/placeholder.png',
//                                             )
//                                             as ImageProvider,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) => SizedBox(height: 16),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:blog_app/features/blog/presentation/blog_details_screen.dart';
import 'package:blog_app/provider/blog_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<BlogProvider>().getAllBlog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //========================= App Bar Section ========================
      appBar: AppBar(
        title: Text("Blog", style: TextStyle(fontSize: 20)),
        centerTitle: true,
        actions: [
          //----------- Search Icon -----------
          GestureDetector(onTap: () {}, child: Icon(Icons.search, size: 25)),
          // Refresh button for testing
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              context.read<BlogProvider>().getAllBlog();
            },
          ),

          SizedBox(width: 16.h),
        ],
      ),

      //=============================== Body Section ========================
      body: SafeArea(
        child: Consumer<BlogProvider>(
          builder: (context, blog, child) {
            if (blog.blogLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (blog.blogList.isEmpty) {
              return Center(
                child: Text(
                  "Blog load failed: ${blog.blogLoadMessage}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              );
            }

            return ListView.separated(
              itemCount: blog.blogList.length,
              itemBuilder: (context, index) {
                //------------- blog post map ----
                final blogPost = blog.blogList[index];

                return SizedBox(
                  height: 164.h,
                  width: 358.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BlogDetailsScreen(blogs: blogPost),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      child: Row(
                        children: [
                          // --------------- Text Section
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ------------ Blog categories
                                Text(
                                  blogPost.categories.isNotEmpty
                                      ? blogPost.categories.join(",")
                                      : "cantegories not found",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff9EA6BA),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                //------------------ Author
                                Text(
                                  "By ${blogPost.author.name}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff9EA6BA),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                // --------------Blog title
                                Text(
                                  blogPost.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                //-------------------- Blog descrioption ---------
                                Text(
                                  blogPost.excerpt,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff9EA6BA),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 4.w),
                          //---------------------------- Image Section-----------------
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blueGrey,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: blogPost.featuredImage.isNotEmpty
                                      ? NetworkImage(blogPost.featuredImage)
                                      : AssetImage(
                                              'assets/images/placeholder.png',
                                            )
                                            as ImageProvider,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
            );
          },
        ),
      ),
    );
  }
}
