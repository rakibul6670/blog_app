import 'package:blog_app/common_widgets/title_icon_row.dart';
import 'package:blog_app/helpers/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //======================== App Bar Section ===============
      appBar: AppBar(
        title: Text("Blog", style: TextStyle(fontSize: 20)),
        centerTitle: true,
        actions: [
          GestureDetector(onTap: () {}, child: Icon(Icons.search, size: 25)),
          //-----------space
          SizedBox(width: 16.h),
        ],
      ),

      //==================== Body Section ==============
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: 28.h),
            // //======================== Heading Title and Icon ===================
            // TitleIconRow(title: "Blog", onTap: () {}, icons: Icons.search),
            SizedBox(height: 20.h),

            //======================= Blog List =============
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 164.h,
                    width: 358.w,
                    child: GestureDetector(
                      onTap: () =>
                          RouteHelper.navigateToBlogDetailsScreen(context),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        child: Row(
                          children: [
                            //============== Text Section ==========
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //----------------- blog type  --
                                  Text(
                                    "Technology",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff9EA6BA),
                                    ),
                                  ),
                                  //------------------blog title -----------
                                  SizedBox(height: 4.h),
                                  Text(
                                    "The Future of AI in Software  Development",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  //------------------blog title -----------
                                  SizedBox(height: 4.h),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Explore how AI is transforming software development,Explore how AI is transforming software development, from code generation to automated testing from code generation to automated testing.Explore how AI is transforming software development, from code generation to automated testing",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                      style: TextStyle(
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9EA6BA),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //===================== Image section =============
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    onError: (context, stackTrace) {
                                      Icon(Icons.image_not_supported);
                                    },
                                    image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI6o5VOuHLBQl59EtVNkumKp_H3YJWH1oiNMTVUQoXkVJiM621quWrOWWeC3hBvEIVLwsyQ0Z0p32Vg5bsaRC68b1oz8kS1e3tcH2WEZaW&s=10",
                                    ),
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
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
