import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:blog_app/helpers/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/back_and_title_row.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------- back icon ----------
                  BackAndTitleRow(title: 'Create Account', onTap: () {  },),

                  SizedBox(height: 20.h),
                  //--------------------- User Field Title  ---------------
                  Text(
                    "Username",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      height: 24 / 16,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  //---------------- Email Form Field -----------
                  TextFormField(
                    // controller: ,
                    // validator: ,
                    decoration: InputDecoration(hintText: "Email or username"),
                  ),

                  SizedBox(height: 12.h),

                  //--------------------- Password Field Title  ---------------
                  Text(
                    "Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      height: 24 / 16,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 8.h),
                  //---------------- Password Form Field -----------
                  TextFormField(
                    // controller: ,
                    // validator: ,
                    decoration: InputDecoration(hintText: "Enter your password"),
                  ),
                  SizedBox(height: 12.h),

                  //--------------------- confirm password Field Title  ---------------
                  Text(
                    "Confirm Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      height: 24 / 16,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 8.h),
                  //---------------- Password Form Field -----------
                  TextFormField(
                    // controller: ,
                    // validator: ,
                    decoration: InputDecoration(
                      hintText: "Enter your confirm password",
                    ),
                  ),

                  //------------- space ---
                  SizedBox(height: 24.h),

                  //-------------------------  Signup Button ---------------------------
                  CustomFilledButton(buttonName: "Register", onPressed: () {
                    RouteHelper.navigateToHomeScreen(context);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

