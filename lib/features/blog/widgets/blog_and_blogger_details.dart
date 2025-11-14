import 'package:blog_app/common_widgets/app_snackbar.dart';
import 'package:blog_app/provider/all_comments_provider.dart';
import 'package:blog_app/provider/like_provider.dart';
import 'package:blog_app/provider/single_blog_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BlogAndBloggerDetails extends StatefulWidget {
  final int postId;

  const BlogAndBloggerDetails({super.key, required this.postId});

  @override
  State<BlogAndBloggerDetails> createState() => _BlogAndBloggerDetailsState();
}

class _BlogAndBloggerDetailsState extends State<BlogAndBloggerDetails> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await (context).read<LikeProvider>().totalLikeCountMethod(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Consumer3<AllCommentProvider, SingleBlogPostProvider, LikeProvider>(
      builder:
          (context, commentProvider, singleBlogProvider, likeProvider, chilld) {
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
                        onTap: () async {
                          if (likeProvider.isLike) {
                            await likeProvider.onTapUnLikeMethod(widget.postId);
                            //------------snackbar show --------
                            AppSnackBar.showSuccess(
                              context,
                              likeProvider.unLikeMessage,
                            );
                          } else {
                            await likeProvider.onTapLikeMethod(widget.postId);
                            //------------snackbar show --------
                            AppSnackBar.showSuccess(
                              context,
                              likeProvider.likeMessage,
                            );
                          }
                          //------------- total count load --------
                          await likeProvider.totalLikeCountMethod(
                            widget.postId,
                          );
                        },
                        child: likeProvider.isLike
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border, color: Colors.grey),
                      ),

                      SizedBox(width: 6.w),
                      //--------------- total Like ------------
                      Text(
                        // singleBlogProvider.singleBlogPostModel?.likeCount
                        //         .toString() ??
                        likeProvider.totalLike.toString(),
                      ),

                      //--------------- Comment Icon  ----------
                      SizedBox(width: 28.w),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.comment,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),

                      SizedBox(width: 6.w),
                      //--------------- total commment ------------
                      Text(commentProvider.allCommentList.length.toString()),
                    ],
                  ),
                ),
              ],
            );
          },
    );
  }
}
