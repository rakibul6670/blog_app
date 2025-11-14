import 'package:blog_app/provider/all_comments_provider.dart';
import 'package:blog_app/provider/single_blog_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BlogAndBloggerDetails extends StatelessWidget {
  const BlogAndBloggerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Consumer2<AllCommentProvider, SingleBlogPostProvider>(
      builder: (context, commentProvider, singleBlogProvider, chilld) {
        return Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    singleBlogProvider.singleBlogPostModel!.author.avatar,
                  ),
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
                        singleBlogProvider.singleBlogPostModel!.author.name,
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
              singleBlogProvider.singleBlogPostModel!.content,
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
                      singleBlogProvider.singleBlogPostModel!.isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),

                  SizedBox(width: 6.w),
                  //--------------- total Like ------------
                  Text(
                    singleBlogProvider.singleBlogPostModel!.likeCount
                        .toString(),
                  ),

                  //--------------- Comment Icon  ----------
                  SizedBox(width: 28.w),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.comment, size: 20, color: Colors.blue),
                  ),

                  SizedBox(width: 6.w),
                  //--------------- total commment ------------
                  Text(
                    commentProvider.commentPaginationModel!.totalComments
                        .toString(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
