import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/features/blog/model/blog_comment_model.dart';
import 'package:blog_app/features/blog/model/blog_author_model.dart';
import 'package:blog_app/features/blog/model/comment_author_model.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

class CommentsProvider extends ChangeNotifier {
  //------------- logger initialized --------------
  Logger logger = Logger();

  //--- comment loading progress show off er jonno ---------
  bool isCommentLoading = false;
  String commentLoadingMessage = "";

  //---------------- Comment Post Load and message ----------
  bool commentPostLoading = false;
  String commentPMessage = "";
  bool isCommentSuccess = false;
  final TextEditingController commentController = TextEditingController();

  //----------------- Page wise Comment Model ------------
  List<BlogCommentModel> pageCommentList = [];

  // List<BlogCommentModel> page1Comment = [];
  // List<BlogCommentModel> page2Comment = [];
  // List<BlogCommentModel> page3Comment = [];

  //========================= Get Comments ==========================================
  Future<void> getAllCommentsMethod(int postId, int page) async {
    try {
      //-------------- loading show -------
      isCommentLoading = true;
      notifyListeners();

      //-------------- comment get request sent ----------
      final ApiLogResponse response = await ApiServices.getData(
        ApiUrls.getCommentUrl(postId, page),
      );

      //-------------- loading off -------
      isCommentLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        //--------------- response data null check --------------
        if (response.responseBody["data"] != null &&
            response.responseBody["data"]["comments"] != null) {
          final List<dynamic> commentList =
              response.responseBody["data"]["comments"];

          logger.i("Number of Comments: ${commentList.length}");

          //--------------- Convert to BlogCommentModel

          pageCommentList = commentList.map<BlogCommentModel>((comment) {
            try {
              return BlogCommentModel.fromJson(comment);
            } catch (e) {
              logger.e("Error parsing comment: $e");
              logger.e("Problematic comment data: $comment");

              //---------------- Return a default comment to empty error fixed ----------
              return BlogCommentModel(
                id: "0",
                postId: "0",
                userId: "0",
                parentId: "0",
                content: 'Error Loading Comment',
                likesCount: 0,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                authorName: 'Unknown',
                replies: [],
                author: CommentAuthorModel(
                  id: "0",
                  name: 'Unknown',
                  email: '',
                  avatar: '',
                ),
                isLiked: false,
              );
            }
          }).toList();

          //-------------------- comment list successful data add check --------------
          logger.i(
            "Successfully store in model ${pageCommentList.length} comments",
          );

          // Assign to respective page list
          // if (page == 1) {
          //   page1Comment = parsedComments;
          // } else if (page == 2) {
          //   page2Comment = parsedComments;
          // } else if (page == 3) {
          //   page3Comment = parsedComments;
          // }

          //--------------- set success message ------
          commentLoadingMessage =
              response.message ?? "Comments loaded successfully";
          notifyListeners();
        } else {
          commentLoadingMessage = "No comments found in response";
          notifyListeners();
        }
      } else {
        commentLoadingMessage = response.message ?? "Comments load failed";
        notifyListeners();
      }
    } catch (e) {
      isCommentLoading = false;
      commentLoadingMessage = "Error: ${e.toString()}";
      notifyListeners();
    }
  }

  //======================== Comment Post =======================
  Future<void> commentPostMethod(int postId, int parentId) async {
    try {
      commentPostLoading = true;
      notifyListeners();

      //--------------- request body ---------
      Map<String, dynamic> requestBody = {
        "post_id": postId,
        "content": commentController.text.trim(),
        "parent_id": parentId,
      };

      final ApiLogResponse response = await ApiServices.postData(
        ApiUrls.postCommentUrl(),
        requestBody,
      );

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        isCommentSuccess = true;

        //---------- loading progress false -------
        commentPostLoading = false;
        commentPMessage = response.message ?? "comment successful --";
      } else {
        commentPostLoading = false;
        commentPMessage = response.message ?? "comment failed --";
      }
      notifyListeners();
    } catch (e) {
      commentPostLoading = false;
      commentPMessage = e.toString();
      notifyListeners();
    }
  }

  //=================== Clear Comments ==================
  void clearPFController() {
    commentController.clear();
  }
}
