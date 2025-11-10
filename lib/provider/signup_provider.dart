import 'package:blog_app/constants/api_urls.dart';
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

  //======================== Signup ==============
  Future signup() async{
    if (formKey.currentState!.validate()) {
      await registerUser();
     
    }
  }

  //======================  Register user =============
  Future registerUser() async {
    try {
     
     isLoading= true;
     notifyListeners();

      //--------------- request body ---------
      Map<String, dynamic> requestBody = {
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "phone": phoneController.text.trim(),
      };

      final response = await ApiServices.postData(
        ApiUrls.registerUrl,
        requestBody,
      );

      isLoading= false;
     notifyListeners();

      if(response["status"]==true && response["statusCode"]== 201  || response["statusCode"]== 200 ){

        final data = response["data"];
        
        logger.i("Register Successful : $data");

        signupMessage = response["message"];
        notifyListeners();

         isSignup = true;
         notifyListeners();
        

      }
      else{

        signupMessage = response["message"];
        notifyListeners();

      }


    } catch (e) {
      
        // logger.i("Register Error : $e");
    }
  }



}
