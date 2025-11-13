import 'package:blog_app/common_widgets/app_snackbar.dart';
import 'package:blog_app/common_widgets/custom_loading_progress.dart';
import 'package:blog_app/provider/singlePosts_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WritesinglePostSecton extends StatelessWidget {
  final int postId;
  final int parentId;

  WritesinglePostSecton({
    super.key,
    required this.postId,
    required this.parentId,
  });

  //------------- formkey ----------
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<singlePostsProvider>(
      builder: (context, singlePost, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),

          child: Row(
            children: [
              //--------------- user profile ---------------
              CircleAvatar(radius: 20.r, backgroundColor: Colors.orange),

              SizedBox(width: 10.w),
              //--------------- Write singlePost ----------
              Expanded(
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: singlePost.singlePostController,
                    validator: (value) {
                      if (value == null) {
                        return "singlePost can't be null";
                      } else if (value!.isEmpty) {
                        return "singlePost can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Write your singlePost ",

                      suffixIcon: Visibility(
                        visible: singlePost.singlePostPostLoading == false,
                        replacement: CustomLoadingProgress(),
                        child: GestureDetector(
                          onTap: () async {
                            //-------------- sent button ------------
                            if (formKey.currentState!.validate()) {
                              await singlePost.singlePostPostMethod(
                                postId,
                                parentId,
                              );

                              if (singlePost.issinglePostSuccess) {
                                AppSnackBar.showSuccess(
                                  context,
                                  singlePost.singlePostPMessage,
                                );
                                singlePost.clearPFController();
                              } else {
                                AppSnackBar.showSuccess(
                                  context,
                                  singlePost.singlePostPMessage,
                                );
                              }
                            }
                          },
                          child: Icon(Icons.send, color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
