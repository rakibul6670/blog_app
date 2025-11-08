import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {


  //-------------------- Controller ---------------
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //------------- form key --------
  final formKey = GlobalKey<FormState>();

}