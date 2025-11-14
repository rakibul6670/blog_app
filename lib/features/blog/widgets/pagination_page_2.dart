import 'package:blog_app/features/blog/presentation/blog_details_screen.dart';
import 'package:blog_app/provider/all_blog_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PaginationPage2 extends StatefulWidget {
  const PaginationPage2({super.key});

  @override
  State<PaginationPage2> createState() => _PaginationPage2State();
}

class _PaginationPage2State extends State<PaginationPage2> {
  //------------------- initState ----------
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await (context).read<AllBlogPostsProvider>().getAllBlog(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AllBlogPostsProvider>(
      builder: (context, blog, child) {
        if (blog.isAllBlogLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (blog.paginationPage2.isEmpty) {
          return Center(
            child: Text(
              "Blog load failed: ${blog.blogLoadMessage}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => blog.getAllBlog(1),
          child: ListView.separated(
            itemCount: blog.paginationPage2.length,
            itemBuilder: (context, index) {
              //------------- blog post map ----
              final blogPost = blog.paginationPage2[index];

              return SizedBox(
                height: 164.h,
                width: 358.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogDetailsScreen(
                          id: blogPost.id,
                          currentPage: blog.paginationModel.currentPage,
                        ),
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
          ),
        );
      },
    );
  }
}
