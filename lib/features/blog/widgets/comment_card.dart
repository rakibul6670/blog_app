import 'package:blog_app/features/blog/model/comment_model.dart';
import 'package:blog_app/provider/all_comments_provider.dart';
import 'package:blog_app/provider/like_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatelessWidget {
  final CommentModel commentModel;
  final AllCommentProvider commentProvider;

  const CommentCard({
    super.key,
    required this.commentModel,
    required this.commentProvider,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Consumer<LikeProvider>(
      builder: (context, likeProvider, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //--------------- this profile-----------
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xff333333),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white24,
                          offset: Offset(-2, -2),
                          blurRadius: 6,
                        ),

                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(3, 3),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //------------Comment woner person name ---
                        Text(
                          commentModel.author.name,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        //------------- content ----------
                        Text(commentModel.content),
                      ],
                    ),
                  ),

                  //======================= Time ,Like and Reply +===============
                  SizedBox(height: 3.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //------------- Post date time ---------
                      Text(
                        commentProvider.dateFormate(commentModel.createdAt),
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyLarge!.copyWith(
                          color: Color(0xff9EA6BA),
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(width: 10.w),

                      //---------------- Like----------
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Like",
                          style: TextStyle(color: Color(0xffF0F2F5)),
                        ),
                      ),

                      SizedBox(width: 10.w),

                      //---------------- Like----------
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Reply",
                          style: TextStyle(color: Color(0xffF0F2F5)),
                        ),
                      ),
                    ],
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
