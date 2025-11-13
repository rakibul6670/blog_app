import 'package:blog_app/features/blog/model/single_blog_post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogAndBloggerDetails extends StatelessWidget {
  final SingleBlogPostModel singleBlogPostModel;

  const BlogAndBloggerDetails({super.key, required this.singleBlogPostModel});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(singleBlogPostModel.author.avatar),
              onBackgroundImageError: (exception, stackTrace) =>
                  Icon(Icons.heart_broken_sharp),
            ),

            SizedBox(width: 10.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //--------------- Blogger details -----
                  Text(
                    "Author",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleSmall,
                  ),
                  //----------------- Blogger name ------------
                  Text(
                    singleBlogPostModel.author.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleSmall!.copyWith(
                      color: Color(0xff9EA6BA),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 4.h),

        //==================== Blog Content ====================
        Text(
          singleBlogPostModel.content,
          style: textTheme.bodyLarge?.copyWith(height: 1.6),
        ),

        //--------------------------- Like and singlePost ------------
        Container(
          height: 56.h,
          width: 390.w,
          //-16,28,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              //--------------- Favorite ----------
              GestureDetector(
                onTap: () {},
                child: Icon(
                  singleBlogPostModel.isLiked
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 20,
                  color: Colors.red,
                ),
              ),

              SizedBox(width: 6.w),
              //--------------- total Like ------------
              Text(singleBlogPostModel.likeCount.toString()),

              //--------------- Comment Icon  ----------
              SizedBox(width: 28.w),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.comment, size: 20, color: Colors.blue),
              ),

              SizedBox(width: 6.w),
              //--------------- total commment ------------
              Text(singleBlogPostModel.commentCount.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
