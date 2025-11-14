import 'package:blog_app/common_widgets/app_snackbar.dart';
import 'package:blog_app/common_widgets/custom_loading_progress.dart';
import 'package:blog_app/features/blog/model/comment_model.dart';
import 'package:blog_app/provider/all_comments_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WriteCommentSecton extends StatefulWidget {
  final int postId;
  final int parentId;
  final int pageNumber;
  final AllCommentProvider allCommentProvider;

  const WriteCommentSecton({
    super.key,
    required this.postId,
    required this.parentId,
    required this.pageNumber,
    required this.allCommentProvider,
  });

  @override
  State<WriteCommentSecton> createState() => _WriteCommentSectonState();
}

class _WriteCommentSectonState extends State<WriteCommentSecton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() async {
      await widget.allCommentProvider.getAllCommentMethod(
        widget.postId,
        widget.parentId,
      );
    });
  }

  //------------- formkey ----------
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),

      child: Row(
        children: [
          //--------------- user profile ---------------
          CircleAvatar(
            radius: 20.r,

            backgroundImage: NetworkImage(""),
            onBackgroundImageError: (error, StackTrace) {
              Icon(Icons.person);
            },
          ),

          SizedBox(width: 10.w),
          //--------------- Write singlePost ----------
          Expanded(
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: widget.allCommentProvider.commentController,
                validator: (value) {
                  if (value == null) {
                    return "singlePost can't be null";
                  } else if (value.isEmpty) {
                    return "singlePost can't be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Write your singlePost ",

                  suffixIcon: Visibility(
                    visible:
                        widget.allCommentProvider.isCommentPostLoading == false,
                    replacement: CustomLoadingProgress(),
                    child: GestureDetector(
                      onTap: () async {
                        //-------------- sent button ------------
                        if (formKey.currentState!.validate()) {
                          await widget.allCommentProvider.commentPostMethod(
                            widget.postId,
                            widget.parentId,
                            1,
                          );
                          // await commentProvider.getAllCommentMethod(postId, page)

                          if (widget.allCommentProvider.isCommentPostSuccess) {
                            //----------- post succes hole aber comment get korbe
                            await widget.allCommentProvider.getAllCommentMethod(
                              widget.postId,
                              widget.parentId,
                            );

                            AppSnackBar.showSuccess(
                              context,
                              widget.allCommentProvider.commentPostMessage,
                            );
                            widget.allCommentProvider.clearPFController();
                          } else {
                            AppSnackBar.showSuccess(
                              context,
                              widget.allCommentProvider.commentPostMessage,
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
  }
}
