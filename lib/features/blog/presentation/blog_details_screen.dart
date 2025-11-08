import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/blog_and_blogger_details.dart';
import '../widgets/comment_card.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      //========================  Icon ======================
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //-------------------- back icon Button --------
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.arrow_back, size: 25),
            ),
            //------------------ Book Mark Icon ------------------
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.bookmark_outline_sharp, size: 25),
            ),
          ],
        ),
      ),

      //======================= Body Section ========================
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //-------------------- image Section ---------------
              SizedBox(
                height: 320.h,
                width: 390.w,
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/6/6e/Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 12.h),
              //========================= Blog Section =================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //---------------- title -------------
                    Text(
                      "The Future of Sustainable Living",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleLarge,
                    ),

                    SizedBox(height: 12.h),

                    //======================  blogger profile ====================-
                    BlogAndBloggerDetails(),

                    SizedBox(height: 16.h),
                    //==================================== Comment Section ================
                    Text(
                      "Comments",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium,
                    ),

                    //---------------------- Comment List ---------
                    SizedBox(height: 16.h),

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

      //==================== write comment section ================
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),

        child: Row(
          children: [
            //--------------- user profile ---------------
            CircleAvatar(radius: 20.r, backgroundColor: Colors.orange),

            SizedBox(width: 10.w),
            //--------------- Write Comment ----------
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Write your comment ",
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.send, color: Colors.green),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
