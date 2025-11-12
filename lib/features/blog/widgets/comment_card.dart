import 'package:blog_app/features/blog/model/blog_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //--------------- this profile
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue.shade100,
          // backgroundImage: NetworkImage(comments.userAvatar),
          // onBackgroundImageError: (error, stackTrace) {
          //   Icon(Icons.image_not_supported);
          // },
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: Column(
            children: [
              //---------------  Name and Comment date ---
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //------------ comment person name ---
                  Text(
                    "comment owner name",
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge,
                  ),

                  SizedBox(width: 5.w),

                  //------------- comment date ---------
                  Text(
                    "2d",
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge!.copyWith(
                      color: Color(0xff9EA6BA),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),

              //------------- content ----------
              Text("comment content"),
            ],
          ),
        ),
      ],
    );
  }
}
