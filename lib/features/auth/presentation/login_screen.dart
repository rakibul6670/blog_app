import 'package:blog_app/common_widgets/app_snackbar.dart';
import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:blog_app/helpers/route_helper.dart';
import 'package:blog_app/helpers/validator.dart';
import 'package:blog_app/provider/login_provider.dart';
import 'package:blog_app/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //------------- form key --------
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //================= body section ===========
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          child: SingleChildScrollView(
            child: Consumer2<LoginProvider, ProfileProvider>(
              builder: (context, provider, profile, child) {
                return Form(
                  key: loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      //-------------------- Screen Title -----------
                      Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),

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

                      //---------------- username Form Field -----------
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: provider.emailController,
                        validator: Validator.validateEmail,
                        decoration: InputDecoration(
                          hintText: "enter your Email",
                        ),
                      ),

                      SizedBox(height: 12.h),

                      //---------------- Password Form Field -----------
                      TextFormField(
                        obscureText: provider.isHide,
                        controller: provider.passwordController,
                        validator: Validator.validatePassword,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "password",
                          suffix: GestureDetector(
                            onTap: () => provider.passwordToggle(),
                            child: Icon(
                              provider.isHide
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),

                      //------------- space ---
                      SizedBox(height: 49.h),

                      //---------------------- Signup Button ---------------------------
                      Visibility(
                        visible: provider.isLoading == false,
                        replacement: Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                        child: CustomFilledButton(
                          buttonName: "Sign in",
                          onPressed: () async {
                            if (loginFormKey.currentState!.validate()) {
                              await provider.loginUser();
                              if (provider.isLoggedIn) {
                                //-------------- profile data load ------
                                await profile.getProfileData();
                                //------------ snackbar show --------
                                AppSnackBar.showSuccess(
                                  context,
                                  provider.loginMessage,
                                );
                                //---------------- clear ----------
                                provider.clearField();
                                //----------- Navigate to home screen  -----
                                RouteHelper.navigateToHomeScreen(context);
                              } else {
                                //------------ snackar show ---------
                                AppSnackBar.showError(
                                  context,
                                  provider.loginMessage,
                                );
                              }
                            }
                          },
                        ),
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
                          RouteHelper.navigateToSignupScreen(context);
                          provider.clearField();
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
