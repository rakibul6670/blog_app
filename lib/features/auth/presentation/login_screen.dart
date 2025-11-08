import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:blog_app/helpers/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/back_and_title_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //================= body section ===========
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  //---------------- back icon ----------
                  BackAndTitleRow(title: 'Sign in', onTap: () {  },),
            
                  //--------------------- Welcome ---------------
                  SizedBox(height: 20.h),
                  Text(
                    "Welcome Back!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28.sp,
                      color: Colors.white,
                    ),
                  ),
            
                  SizedBox(height: 12.h),
            
                  //---------------- Email Form Field -----------
                  TextFormField(
                    // controller: ,
                    // validator: ,
                    decoration: InputDecoration(hintText: "Email or username"),
                  ),
            
                  SizedBox(height: 12.h),
            
                  //---------------- Password Form Field -----------
                  TextFormField(
                    // controller: ,
                    // validator: ,
                    decoration: InputDecoration(hintText: "password"),
                  ),
            
                  //------------- space ---
                  SizedBox(height: 49.h),
            
                  //---------------------- Signup Button ---------------------------
                  CustomFilledButton(
                    buttonName: "Sign in",
                    onPressed: () => RouteHelper.navigateToSignupScreen(context),
                  ),
            
                  //------------------- bottom Signup link text --------
                  SizedBox(height: 322.h),
            
                  Text(
                    "Don't have an account ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color(0xff9EA6BA),
                    ),
                  ),
            
                  SizedBox(height: 12.h),
                  GestureDetector(
                    onTap: () {
                      // RouteHelper.
                    },
                    child: Text(
                      "Sign up ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: Color(0xff9EA6BA),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
