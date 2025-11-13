import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/features/blog/model/pagination_model.dart';
import 'package:blog_app/features/blog/model/single_blog_post_model.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

class SingleBlogPostProvider extends ChangeNotifier {
  final Logger logger = Logger();
  //--------------- blog data get loading ---------
  bool isLoadingProgress = false;
  //--------------- blog data get message ---------
  String postLoadMessage = "";
  //------------- single post list ------------
  SingleBlogPostModel? singleBlogPostModel;
  PaginationModel? paginationModel;

  //========================= Get Blog ==========================================
  Future<void> getSinglePost(int id) async {
    try {
      //-------------- laoding show -------
      isLoadingProgress = true;
      notifyListeners();

      //-------------- blog get request sent ----------
      final ApiLogResponse response = await ApiServices.getData(
        ApiUrls.getSinglePostUrl(id),
      );
      //-------------- laoding off -------
      isLoadingProgress = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        //--------------- response data null check --------------
        if (response.responseBody["data"] != null &&
            response.responseBody["data"]["post"] != null) {
          final Map<String, dynamic> postList =
              response.responseBody["data"]["post"];

          final Map<String, dynamic> pagination =
              response.responseBody["data"]["post"];

          logger.i("Number of post check : ${postList.length}");

          //---------------  Convert to  Single Blog post model e -----
          singleBlogPostModel = SingleBlogPostModel.fromJson(postList);
          paginationModel = PaginationModel.fromJson(pagination);
          //---------------set success message ------
          postLoadMessage =
              response.message ?? "Blog post convert model successfully";
          notifyListeners();
        } else {
          postLoadMessage = "No posts found in response";
          notifyListeners();
        }
      } else {
        isLoadingProgress = false;
        postLoadMessage = response.message ?? "Blog load failed";
        notifyListeners();
      }
    } catch (e) {
      isLoadingProgress = false;
      postLoadMessage = "Error: ${e.toString()}";
      notifyListeners();
    }
  }
}
