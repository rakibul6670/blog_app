// import 'package:blog_app/constants/api_urls.dart';
// import 'package:blog_app/features/blog/model/blog_post_model.dart';
// import 'package:blog_app/helpers/api_log_response.dart';
// import 'package:blog_app/network/api_services.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/web.dart' show Logger;

// class BlogProvider extends ChangeNotifier {
//   //------------------ BlogList ---------------
//   List<BlogPostModel> blogList = [];

//   //--------------- blog data get loading ---------
//   bool blogLoading = false;
//   //--------------- blog data get message ---------
//   String blogLoadMessage = "";

//   //========================= Get Blog ==========================================
//   Future<void> getAllBlog() async {
//     try {
//       blogLoading = true;
//       notifyListeners();

//       final ApiLogResponse response = await ApiServices.getData(
//         ApiUrls.getAllBlogUrl,
//       );

//       blogLoading = false;
//       notifyListeners();

//       if (response.status == true &&
//           (response.statusCode == 201 || response.statusCode == 200)) {
//         final Logger logger = Logger();

//         // logger.i(
//         //   " BLog data : \n \n \n  ${response.responseBody["data"]["posts"]}\n",
//         // );
//         // logger.i(
//         //   "responseBody Type: \n ${response.responseBody.runtimeType}\n ",
//         // );
//         //--------------- Post List here -----------
//         final List<dynamic> postList =
//             (response.responseBody["data"]?["posts"] ?? []) as List<dynamic>;

//         blogList = postList
//             .map((post) => BlogPostModel.fromJson(post))
//             .toList();

//         //---------------set success message ------
//         blogLoadMessage = response.message ?? "blog load successful --";
//         logger.i("First Post: \n ${postList.first}");

//         notifyListeners();
//       } else {
//         blogLoadMessage = response.message ?? "blog load failed --";
//         notifyListeners();
//       }
//     } catch (e) {
//       blogLoadMessage = e.toString();
//       notifyListeners();
//     }
//   }
// }

import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/features/blog/model/blog_author_model.dart';
import 'package:blog_app/features/blog/model/blog_post_model.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

class BlogProvider extends ChangeNotifier {
  final Logger logger = Logger();
  //------------------ BlogList ---------------
  List<BlogPostModel> blogList = [];

  //--------------- blog data get loading ---------
  bool blogLoading = false;
  //--------------- blog data get message ---------
  String blogLoadMessage = "";

  //================ Constructor e data load ===========
  BlogProvider() {
    getAllBlog();
  }

  //========================= Get Blog ==========================================
  Future<void> getAllBlog() async {
    try {
      //-------------- laoding show -------
      blogLoading = true;
      notifyListeners();

      //-------------- blog get request sent ----------
      final ApiLogResponse response = await ApiServices.getData(
        ApiUrls.getAllBlogUrl,
      );
      //-------------- laoding off -------
      blogLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        //--------------- response data null check --------------
        if (response.responseBody["data"] != null &&
            response.responseBody["data"]["posts"] != null) {
          final List<dynamic> postList = response.responseBody["data"]["posts"];

          logger.i("Number of posts check : ${postList.length}");

          //---------------  Convert to  BlogPostModel
          blogList = postList.map<BlogPostModel>((post) {
            try {
              return BlogPostModel.fromJson(post);
            } catch (e) {
              logger.e("Error parsing post: $e");
              logger.e("Problematic post data: $post");

              //----------------  Return a default post to empty error fixed ----------
              return BlogPostModel(
                id: 0,
                title: 'Error Loading Post',
                excerpt: '',
                featuredImage: '',
                author: BlogAuthorModel(id: 0, name: 'Unknown', avatar: ''),
                categories: [],
                readTime: '0',
                createdAt: '',
                likeCount: 0,
                commentCount: 0,
                isLiked: false,
                isBookmarked: false,
              );
            }
          }).toList();

          //-------------------- blog list successful data addd check --------------
          logger.i("Successfully parsed to bloglist  ${blogList.length} posts");

          //---------------set success message ------
          blogLoadMessage = response.message ?? "Blog loaded successfully";
          notifyListeners();
        } else {
          blogLoadMessage = "No posts found in response";

          notifyListeners();
        }
      } else {
        blogLoadMessage = response.message ?? "Blog load failed";

        notifyListeners();
      }
    } catch (e) {
      blogLoading = false;
      blogLoadMessage = "Error: ${e.toString()}";

      notifyListeners();
    }
  }
}
