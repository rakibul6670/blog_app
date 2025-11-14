import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/features/blog/model/comment_model.dart';
import 'package:blog_app/features/blog/model/comment_pagination_model.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/web.dart';

class AllCommentProvider extends ChangeNotifier {
  //------------- logger initialized --------------
  Logger logger = Logger();

  //---  Comment post loading status  and message with success status ---------
  bool isCommentPostLoading = false;
  bool isCommentPostSuccess = false;
  String commentPostMessage = "";

  //---------------- Comment get loading status  and message ----------
  bool isCommentGetLoading = false;
  String commentGetMessage = "";
  List<CommentModel> allCommentList = [];

  //-------------- Controller ---------
  final TextEditingController commentController = TextEditingController();

  CommentPaginationModel? commentPaginationModel = CommentPaginationModel(
    currentPage: 1,
    perPage: 10,
    totalComments: 0,
    totalPages: 1,
  );

  Future<void> getAllCommentMethod(int postId, int page) async {
    try {
      // page number kokhon o 0 hobe na ,
      if (page < 1) page = 1;

      // ---------loading start
      isCommentGetLoading = true;
      notifyListeners();

      final ApiLogResponse response = await ApiServices.getData(
        ApiUrls.getCommentUrl(postId, page),
      );

      isCommentGetLoading = false;

      if (response.status == true &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        final data = response.responseBody["data"];

        if (data == null || data["comments"] == null) {
          commentGetMessage = "No comments found";
          notifyListeners();
          return;
        }

        //---------- new page data --------------
        final List<dynamic> commentList = data["comments"];

        if (page == 1) {
          allCommentList = commentList
              .map((e) => CommentModel.fromJson(e))
              .toList();
        } else {
          allCommentList.addAll(
            commentList.map((e) => CommentModel.fromJson(e)),
          );
        }

        //---------- Pagination model set ----------
        Map<String, dynamic> pagination = data["pagination"];

        if (pagination != null) {
          commentPaginationModel = CommentPaginationModel.fromJson(pagination);
          notifyListeners();
          logger.w("Pagination Found");
          logger.w("Current Page: ${pagination['current_page']}");
          logger.w("Per Page: ${pagination['per_page']}");
          logger.w("Total Comments: ${pagination['total_comments']}");
          logger.w("Total Pages: ${pagination['total_pages']}");
          logger.w(
            "Total Comments Model: ${commentPaginationModel!.totalComments}",
          );
        } else {
          logger.e(" Pagination NOT FOUND!");
        }

        commentGetMessage = "Comments loaded";
      } else {
        commentGetMessage = response.message ?? "Failed to load comments";
      }

      notifyListeners();
    } catch (e) {
      isCommentGetLoading = false;
      commentGetMessage = "Error: ${e.toString()}";
      notifyListeners();
    }
  }

  //========================= Get singlePosts ==========================================
  // Future<void> getAllCommentMethod(int postId, int page) async {
  //   try {
  //     if (page < 1) {
  //       page = 1;
  //     }
  //     //-------------- loading show -------
  //     isCommentGetLoading = true;
  //     notifyListeners();

  //     //-------------- singlePost get request sent ----------
  //     final ApiLogResponse response = await ApiServices.getData(
  //       ApiUrls.getCommentUrl(postId, page),
  //     );

  //     //-------------- loading off -------
  //     isCommentGetLoading = false;
  //     notifyListeners();

  //     if (response.status == true &&
  //         (response.statusCode == 201 || response.statusCode == 200)) {
  //       //--------------- response data null check --------------
  //       if (response.responseBody["data"] != null &&
  //           response.responseBody["data"]["comments"] != null) {
  //         //---------- comment list -------------
  //         final List<dynamic> commentList =
  //             response.responseBody["data"]["comments"];

  //         logger.i("Number of Comment List: ${commentList.length}");

  //         //--------------- Convert to Comment Model-----------
  //         allCommentList = commentList
  //             .map((comment) => CommentModel.fromJson(comment))
  //             .toList();

  //         //-------------------------- Comment and page number here -----------
  //         final Map<String, dynamic> pagination =
  //             response.responseBody["data"]["pagination"];

  //         commentPaginationModel = CommentPaginationModel.fromJson(pagination);
  //         logger.i("Comment Pagination Model : $pagination");

  //         //-------------------- singlePost list successful data add check --------------
  //         logger.i(
  //           "Successfully store in Comment model ${allCommentList.length} ",
  //         );

  //         //--------------- set success message ------
  //         commentGetMessage = response.message ?? "Comment get successfully";
  //         notifyListeners();
  //       } else {
  //         //--------------- set Failed message ------
  //         commentGetMessage = "No Comment found in response";
  //         notifyListeners();
  //       }
  //     } else {
  //       commentGetMessage = response.message ?? "Comment load failed";
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     isCommentGetLoading = false;
  //     commentGetMessage = "Error: ${e.toString()}";
  //     notifyListeners();
  //   }
  // }

  //======================== Comment Post Method =====================================
  Future<void> commentPostMethod(
    int postId,
    int parentId,
    int pageNumber,
  ) async {
    try {
      isCommentPostLoading = true;
      notifyListeners();

      //--------------- request body ---------
      Map<String, dynamic> requestBody = {
        "post_id": postId,
        "content": commentController.text.trim(),
        "parent_id": parentId,
      };

      final ApiLogResponse response = await ApiServices.postData(
        ApiUrls.commentPostUrl(pageNumber),
        requestBody,
      );

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        //------------ set comment post status succes -------
        isCommentPostSuccess = true;

        //---------- loading progress false -------
        isCommentPostLoading = false;
        //----------- success message set ---------
        commentPostMessage = response.message ?? "Comment successful --";
      } else {
        isCommentPostLoading = false;
        commentPostMessage = response.message ?? "Comment failed --";
      }
      notifyListeners();
    } catch (e) {
      isCommentPostLoading = false;
      commentPostMessage = e.toString();
      notifyListeners();
    }
  }

  //======================== Date Time Convert ==========
  String dateFormate(String date) {
    DateTime past = DateTime.parse(date);
    Duration diff = DateTime.now().difference(past);
    if (diff.inSeconds < 60) {
      return "${diff.inSeconds} s";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} m";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} h";
    } else if (diff.inDays < 7) {
      return "${diff.inDays} d";
    } else {
      return DateFormat("dd MM yyyy").format(past);
    }
  }

  //=================== Clear singlePosts ==================
  void clearPFController() {
    commentController.clear();
  }
}
