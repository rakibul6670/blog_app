import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/helpers/auth_get_storage.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginProvider extends ChangeNotifier {
  final Logger logger = Logger();

  //-------------------- Controller ---------------
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //------------ loading progress for show / off -----
  bool isLoading = false;
  String loginMessage = "";
  //----------- logged in check for snackbar message show
  bool isLoggedIn = false;

  //--------------- logout loading status ------
  bool logoutLoading = false;
  String logoutMessage = '';
  bool isLogout = false;
  bool isHide = true;

  //====================== Password hide and show ===========
  void passwordToggle() {
    isHide = !isHide;
    notifyListeners();
  }

  //======================  Register user =============
  Future loginUser() async {
    try {
      isLoading = true;
      notifyListeners();

      //--------------- request body ---------
      Map<String, dynamic> requestBody = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      final ApiLogResponse response = await ApiServices.postData(
        ApiUrls.loginUrl,
        requestBody,
        withToken: false,
      );

      // isLoading = false;
      // notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        //----------- logged in check for message show
        isLoggedIn = true;

        //----------- save token ----------
        await AuthGetStorage.saveUserToken(
          response.responseBody["data"]["token"] ?? "",
        );

        await AuthGetStorage.loginStatusSave(true);

        logger.i("login status: ${AuthGetStorage.getLoginStatus()}");
        isLoading = false;
        loginMessage = response.message ?? "Login successful --";

        notifyListeners();
      } else {
        isLoading = false;
        loginMessage = response.message ?? "Login failed --";

        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      loginMessage = e.toString();
      notifyListeners();
    }
  }

  //======================  Logout user =============
  Future logout() async {
    try {
      logoutLoading = true;
      notifyListeners();

      //--------------- request body ---------
      Map<String, dynamic> requestBody = {};

      final ApiLogResponse response = await ApiServices.postData(
        ApiUrls.logoutUrl,
        requestBody,
      );

      logoutLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        logoutMessage = response.message ?? "Logout successful --";
        await AuthGetStorage.clearUserToken();
        await AuthGetStorage.clearLoginStatus();
        isLogout = true;
        notifyListeners();
      } else {
        loginMessage = response.message ?? "Logout failed --";
        notifyListeners();
      }
    } catch (e) {
      loginMessage = e.toString();
      notifyListeners();
    }
  }

  //------------------- clear -------------
  void clearField() {
    emailController.clear();
    passwordController.clear();
  }
}
