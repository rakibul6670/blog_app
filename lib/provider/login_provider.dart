import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  //-------------------- Controller ---------------
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //------------- form key --------
  final formKey = GlobalKey<FormState>();

  //----------- login status ------

  bool isLoggedIn = false;

  //------------ loading progress for show / off -----
  bool isLoading = false;

  void login() {
    if (formKey.currentState!.validate()) {
      isLoggedIn = true;
      notifyListeners();
    }
  }
}
