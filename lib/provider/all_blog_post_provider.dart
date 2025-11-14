import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/features/blog/model/all_blog_posts_model.dart';
import 'package:blog_app/features/blog/model/pagination_model.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

class AllBlogPostsProvider extends ChangeNotifier {
  final Logger logger = Logger();

  //------------------ Pagination page 1 ---------------
  List<AllBlogPostsModel> paginationPage1 = [];

  //------------------ PaginationPage2 ---------------
  List<AllBlogPostsModel> paginationPage2 = [];
  //------------------ PaginationPage2 ---------------
  List<AllBlogPostsModel> paginationPage3 = [];

  //----------------- default value set for that no error show -------
  PaginationModel paginationModel = PaginationModel(
    currentPage: 0,
    perPage: 0,
    totalPosts: 0,
    totalPages: 0,
  );

  //--------------- blog data get loading ---------
  bool isAllBlogLoading = false;
  //--------------- blog data get message ---------
  String blogLoadMessage = "";

  //================ Constructor e data load ===========
  AllBlogPostsProvider() {
    getAllBlog(1);
  }

  //========================= Get Blog ==========================================
  Future<void> getAllBlog(int page) async {
    try {
      //-------------- laoding show -------
      isAllBlogLoading = true;
      notifyListeners();

      //-------------- blog get request sent ----------
      final ApiLogResponse response = await ApiServices.getData(
        Uri.parse("${ApiUrls.getAllBlogUrl}?page=$page"),
      );
      //-------------- laoding off -------
      isAllBlogLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        //--------------- response data null check --------------
        if (response.responseBody["data"] != null &&
            response.responseBody["data"]["posts"] != null) {
          final List<dynamic> postList = response.responseBody["data"]["posts"];

          //================= pagination check ----------
          if (response.responseBody["data"]["posts"] != null) {
            final Map<String, dynamic> pagination =
                response.responseBody["data"]["pagination"];
            logger.i(pagination);
            //------pagination value set for that we can easyly access page number -
            logger.i(
              "\n Pagination Current Page \n ${pagination["current_page"]}",
            );
            paginationModel = PaginationModel(
              currentPage: pagination["current_page"],
              perPage: pagination["per_page"],
              totalPosts: pagination["total_posts"],
              totalPages: pagination["total_pages"],
            );
            notifyListeners();
          }

          logger.i("Number of posts check : ${postList.length}");

          //---------------  Convert to  AllBlogPostsModel
          List<AllBlogPostsModel> blogList = postList.map<AllBlogPostsModel>((
            post,
          ) {
            try {
              return AllBlogPostsModel.fromJson(post);
            } catch (e) {
              logger.e("Error parsing post: $e");
              logger.e("Problematic post data: $post");

              //----------------  Return a default post to empty error fixed ----------
              return AllBlogPostsModel(
                id: 0,
                title: 'Error Loading Post',
                excerpt: '',
                featuredImage: '',
                categories: [],
              );
            }
          }).toList();

          //-------------------- blog list successful data addd check --------------
          logger.i("Successfully parsed to bloglist  ${blogList.length} posts");
          if (page == 1) {
            paginationPage1 = blogList;
          } else if (page == 2) {
            paginationPage2 = blogList;
          } else if (page == 3) {
            paginationPage3 = blogList;
          }

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
      isAllBlogLoading = false;
      blogLoadMessage = "Error: ${e.toString()}";

      notifyListeners();
    }
  }
}
