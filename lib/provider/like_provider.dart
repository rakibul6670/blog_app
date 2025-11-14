import 'package:blog_app/common_widgets/app_snackbar.dart';
import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class LikeProvider extends ChangeNotifier {
  static Logger logger = Logger();

  bool isLike = false;
  int totalLike = 0;
  String likeMessage = "";
  String unLikeMessage = "";

  //-------------------------- Like Count --------------------
  Future<void> totalLikeCountMethod(int postId) async {
    try {
      final ApiLogResponse response = await ApiServices.getData(
        ApiUrls.getPostLikeUrl(postId),
      );

      if (response.status == true &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        //------------- console e success message show----

        final List likes = response.responseBody["data"]["likes"];

        if (likes.isNotEmpty) {
          //-------- already liked check false or true set -----
          isLike = likes.any((like) => like['user']['id'] == postId);
          //---------- total like e value set
          totalLike = int.parse(response.responseBody["data"]["total_likes"]);
        }
      } else {
        //--------------
        logger.i(response.message ?? "Like count get Failed");
      }
    } catch (e) {
      logger.i("Error: ${e.toString()}");
    }
  }

  //---------------- OnTap Like -------------------
  Future<void> onTapLikeMethod(int postId) async {
    try {
      final ApiLogResponse response = await ApiServices.postData(
        ApiUrls.likePostUrl(postId),
        {},
      );

      if (response.status == true &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        bool isLiked = response.responseBody["data"]["liked"];

        //-------------console e success show
        logger.i(response.message ?? "Like  success");
        if (isLiked) {
          isLike = true;
          totalLike++;
        }
        likeMessage = response.message ?? "Liked success";
        notifyListeners();
      } else {
        //-------------- failed to like
        logger.i(response.message ?? "Like faild Failed");
        likeMessage = response.message ?? "Liked failed";
        notifyListeners();
      }
    } catch (e) {
      logger.i("Error: ${e.toString()}");
    }
  }

  //---------------- OnTap UnLike -------------------
  Future<void> onTapUnLikeMethod(int postId) async {
    try {
      final ApiLogResponse response = await ApiServices.postData(
        ApiUrls.unLikePostUrl(postId),
        {},
      );

      if (response.status == true &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        //-------------console e success show
        logger.i(response.message ?? "unLike  success");

        bool isLiked = response.responseBody["data"]["liked"];
        //--------- condition chek then true hole total - 1
        if (!isLiked) {
          isLike = false;
          totalLike--;
        }
        unLikeMessage = response.message ?? "unLiked success";
        notifyListeners();
      } else {
        //-------------- failed to like
        logger.i(response.message ?? "unLike faild Failed");
        unLikeMessage = response.message ?? "unLiked failed";
        notifyListeners();
      }
    } catch (e) {
      logger.i("Error: ${e.toString()}");
    }
  }

  //============================== Like Unlike ===============
}
