import 'package:blog_app/common_widgets/app_snackbar.dart';
import 'package:blog_app/common_widgets/custom_loading_progress.dart';
import 'package:blog_app/provider/comments_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WriteCommentSecton extends StatelessWidget {
  final int postId;
  final int parentId;

  WriteCommentSecton({super.key, required this.postId, required this.parentId});

  //------------- formkey ----------
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentsProvider>(
      builder: (context, comment, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),

          child: Row(
            children: [
              //--------------- user profile ---------------
              CircleAvatar(radius: 20.r, backgroundColor: Colors.orange),

              SizedBox(width: 10.w),
              //--------------- Write Comment ----------
              Expanded(
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: comment.commentController,
                    validator: (value) {
                      if (value == null) {
                        return "Comment can't be null";
                      } else if (value!.isEmpty) {
                        return "comment can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Write your comment ",

                      suffixIcon: Visibility(
                        visible: comment.commentPostLoading == false,
                        replacement: CustomLoadingProgress(),
                        child: GestureDetector(
                          onTap: () async {
                            //-------------- sent button ------------
                            if (formKey.currentState!.validate()) {
                              await comment.commentPostMethod(postId, parentId);

                              if (comment.isCommentSuccess) {
                                AppSnackBar.showSuccess(
                                  context,
                                  comment.commentPMessage,
                                );
                                comment.clearPFController();
                              } else {
                                AppSnackBar.showSuccess(
                                  context,
                                  comment.commentPMessage,
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
