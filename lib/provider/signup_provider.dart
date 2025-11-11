import 'package:blog_app/constants/api_urls.dart';
import 'package:blog_app/helpers/api_log_response.dart';
import 'package:blog_app/network/api_services.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart' show Logger;

class SignupProvider extends ChangeNotifier {
  final Logger logger = Logger();

  final formKey = GlobalKey<FormState>();

  //--------------- Controller -----------
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //------------------ isSignup status ---------
  bool isSignup = false;
  //------------ loading progress for show / off -----
  bool isLoading = false;

  String signupMessage = "";

  //------------- password hiden --------
  bool isHide = true;

  void passwordToggle() {
    isHide = !isHide;
    notifyListeners();
  }

  //======================  Register user =============
  Future registerUser() async {
    try {
      isLoading = true;
      notifyListeners();

      //--------------- request body ---------
      Map<String, dynamic> requestBody = {
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "phone": phoneController.text.trim(),
      };

      final ApiLogResponse response = await ApiServices.postData(
        ApiUrls.registerUrl,
        requestBody,
        withToken: false,
      );

      isLoading = false;
      notifyListeners();

      if (response.status == true &&
          (response.statusCode == 201 || response.statusCode == 200)) {
        //---------- set success message ---
        signupMessage = response.message ?? "Registration successful";
        //---------- set is signup true---
        isSignup = true;
        notifyListeners();
      } else {
        signupMessage = response.message ?? "Registration failed";
        notifyListeners();
      }
    } catch (e) {
      signupMessage = e.toString();
      notifyListeners();
    }
  }

  //================== clear field ===========
  void clearFields() {
    print("clear fields called");
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
  }
}
