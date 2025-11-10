import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginProvider extends ChangeNotifier {
  final Logger logger = Logger();
  //-------------------- Controller ---------------
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //------------- form key --------
  final formKey = GlobalKey<FormState>();

  //----------- login status ------

  bool isLoggedIn = false;

  //------------ loading progress for show / off -----
  bool isLoading = false;
  String loginMessage = "";

  // Future login() async {
  //   if (formKey.currentState!.validate()) {
  //     await loginUser();
  //   }
  // }

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
      );

      isLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        loginMessage = response.message ?? "Login successful --";
        isLoggedIn = true;
        notifyListeners();
      } else {
        loginMessage = response.message ?? "Login failed --";
        isLoggedIn = false;
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
