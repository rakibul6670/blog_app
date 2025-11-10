import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  //--------------- Controller -----------
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  //------------------ isSignup status ---------
  bool isSignup = false;
  //------------ loading progress for show / off -----
  bool isLoading = false;

  //======================== Signup ==============
  void signup() {
    if (formKey.currentState!.validate()) {
      isSignup = true;
      notifyListeners();
    }
  }
}
