import 'package:blog_app/features/blog/model/blog_singlePost_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class singlePostCard extends StatelessWidget {
  final BlogsinglePostModel singlePostModel;

  const singlePostCard({super.key, required this.singlePostModel});

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
          backgroundImage: NetworkImage(singlePostModel.author.avatar),
          onBackgroundImageError: (error, stackTrace) {
            Icon(Icons.image_not_supported);
          },
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---------------  Name and singlePost date ---
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //------------ singlePost person name ---
                  Text(
                    singlePostModel.author.name,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge,
                  ),

                  SizedBox(width: 5.w),

                  //------------- singlePost date ---------
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
              Text(singlePostModel.author.email),
              SizedBox(height: 5.h),

              //------------- content ----------
              Text(singlePostModel.content),
            ],
          ),
        ),
      ],
    );
  }
}
