import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:blog_app/helpers/route_helper.dart';
import 'package:blog_app/helpers/validator.dart';
import 'package:blog_app/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/back_and_title_row.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupProvider(),
      child: Scaffold(
        //================= body section ===========
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
            child: SingleChildScrollView(
              child: Consumer<SignupProvider>(
                builder: (context, provider, child) {
                  return Form(
                    key: provider.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //---------------- back icon ----------
                        BackAndTitleRow(title: 'Create Account'),

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

                        //---------------- Username Form Field -----------
                        TextFormField(
                          controller: provider.userNameController,
                          validator: Validator.validateUsername,
                          decoration: InputDecoration(
                            hintText: "Email or username",
                          ),
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
                          controller: provider.passwordController,
                          validator: Validator.validatePassword,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                          ),
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
                        //----------------Confirm Password Form Field -----------
                        TextFormField(
                          controller: provider.confirmPasswordController,
                          validator: (value) =>
                              Validator.validateConfirmPassword(
                                value,
                                provider.passwordController.text,
                              ),
                          decoration: InputDecoration(
                            hintText: "Enter your confirm password",
                          ),
                        ),

                        //------------- space ---
                        SizedBox(height: 24.h),

                        //-------------------------  Signup Button ---------------------------
                        CustomFilledButton(
                          buttonName: "Register",
                          onPressed: () {
                            provider.signup();
                            if (provider.isSignup) {
                              //----------- signup successful  -----
                              RouteHelper.navigateToLoginScreen(context);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
