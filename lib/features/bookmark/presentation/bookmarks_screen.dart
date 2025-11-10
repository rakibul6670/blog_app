import 'package:blog_app/common_widgets/back_and_title_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 28.h),
            //======================== Heading Back Button And Screen Title ==============
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: BackAndTitleRow(title: "Bookmarks"),
            ),

            SizedBox(height: 20.h),
            //========================== Search Bar Section ====================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search bookmarks",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            //============================= Bookmarks ListView =================
            SizedBox(height: 17.h),

            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 390.w,
                    height: 90,
                    child: Row(
                      children: [
                        //=====================  image =======================
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 17,
                          ),
                          height: 90.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              //fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HjyNG7M_68VGfZhDKad8hb4zJqHc4U7aiQ&s",
                              ),
                            ),
                          ),
                        ),

                        //==================== Text Section ===================
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SEO Strategies for Beginners",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.titleSmall,
                                ),
                                //SizedBox(height: 5.h,),
                                Text(
                                  "A comprehensive guide to understanding and implementing effective SEO strategies for your website.",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodySmall!.copyWith(
                                    color: Color(0xff9EA6BA),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
