import 'package:blog_app/features/blog/model/blog_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  final BlogCommentModel commentModel;

  const CommentCard({super.key, required this.commentModel});

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
          backgroundImage: NetworkImage(commentModel.author.avatar),
          onBackgroundImageError: (error, stackTrace) {
            Icon(Icons.image_not_supported);
          },
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---------------  Name and Comment date ---
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //------------ comment person name ---
                  Text(
                    commentModel.author.name,
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
              SizedBox(height: 3.h),
              //-----------user email -----------
              Text(commentModel.author.email),
              SizedBox(height: 5.h),

              //------------- content ----------
              Text(commentModel.content),
            ],
          ),
        ),
      ],
    );
  }
}
