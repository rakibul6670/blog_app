import 'package:blog_app/features/blog/widgets/pagination_box.dart';
import 'package:blog_app/features/blog/widgets/pagination_page_1.dart';
import 'package:blog_app/features/blog/widgets/pagination_page_2.dart';
import 'package:blog_app/features/blog/widgets/pagination_page_3.dart';

import 'package:blog_app/provider/tab_bar_provider.dart';
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TabBarProvider(),

      child: Scaffold(
        //========================= App Bar Section ========================
        appBar: AppBar(
          title: Text("Blog", style: TextStyle(fontSize: 20)),
          centerTitle: true,
          actions: [
            //----------- Search Icon -----------
            GestureDetector(onTap: () {}, child: Icon(Icons.search, size: 25)),

            Icon(Icons.category),

            SizedBox(width: 16.h),
          ],
        ),

        //=============================== Body Section ========================
        body: SafeArea(
          child: Consumer<TabBarProvider>(
            builder: (context, tap, child) {
              return DefaultTabController(
                length: 3,
                initialIndex: tap.selectedTab,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //========================= Blog Card Section ========================
                    Expanded(
                      child: TabBarView(
                        children: [
                          //============ Pagination page 1 =====
                          PaginationPage1(),
                          //============ Pagination page 2 =====
                          PaginationPage2(),
                          //============ Pagination page 3 =====
                          PaginationPage3(),
                        ],
                      ),
                    ),

                    //======================= Pagination ============================
                    //------- space -----
                    SizedBox(height: 10.h),

                    TabBar(
                      onTap: (index) => tap.onTapChangeTap(index),
                      isScrollable: false,
                      indicatorColor: Colors.transparent,

                      tabAlignment: TabAlignment.center,
                      indicatorWeight: 0,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.transparent),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white70,

                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      tabs: [
                        //------------ Page Number 1 ---------
                        PaginationBox(
                          active: tap.selectedTab == 0,
                          pageNumber: 1,
                        ),

                        //------------- Page Number 2 --------------
                        PaginationBox(
                          active: tap.selectedTab == 1,
                          pageNumber: 2,
                        ),

                        //------------------- Page Number 3 ----------
                        PaginationBox(
                          active: tap.selectedTab == 2,
                          pageNumber: 3,
                        ),
                      ],
                    ),
                    //-------- space ---------
                    SizedBox(height: 10.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
