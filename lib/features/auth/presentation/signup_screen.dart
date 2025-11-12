import 'package:blog_app/common_widgets/app_snackbar.dart';
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
    return Scaffold(
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
                      BackAndTitleRow(
                        title: 'Create Account',
                        onTap: () {
                          Navigator.pop(context);
                          provider.clearFields();
                        },
                      ),

                      SizedBox(height: 20.h),
                      //--------------------- User Field Title  ---------------
                      Text(
                        "Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          height: 24 / 16,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      //----------------Name Form Field -----------
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: provider.nameController,
                        validator: Validator.validatename,
                        decoration: InputDecoration(
                          hintText: "Email your name",
                        ),
                      ),

                      SizedBox(height: 12.h),

                      //--------------------- Email Field Title  ---------------
                      Text(
                        "Email",
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
                        textInputAction: TextInputAction.next,
                        controller: provider.emailController,
                        validator: Validator.validateEmail,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                        ),
                      ),
                      SizedBox(height: 12.h),

                      //--------------------- Password Field Title  ---------------
                      Text(
                        "Phone Number",
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
                        textInputAction: TextInputAction.next,
                        controller: provider.phoneController,
                        validator: Validator.validatePhone,
                        decoration: InputDecoration(
                          hintText: "Enter your phone number",
                        ),
                      ),
                      SizedBox(height: 12.h),

                      //---------------------  password Field Title  ---------------
                      Text(
                        " Password",
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
                        obscureText: provider.isHide,
                        textInputAction: TextInputAction.next,
                        controller: provider.passwordController,
                        validator: Validator.validatePassword,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
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
                      SizedBox(height: 24.h),

                      //-------------------------  Signup Button ---------------------------
                      Visibility(
                        visible: provider.isLoading == false,
                        replacement: Center(
                          child: CircularProgressIndicator(color: Colors.amber),
                        ),
                        child: CustomFilledButton(
                          buttonName: "Register",
                          onPressed: () async {
                            if (provider.formKey.currentState!.validate()) {
                              await provider.registerUser();
                              if (provider.isSignup) {
                                //------------ snackbar show --------
                                AppSnackBar.showSuccess(
                                  context,
                                  provider.signupMessage,
                                );

                                provider.clearFields();

                                //-------------- navigate to login screen ------
                                RouteHelper.navigateToLoginScreen(context);
                              } else {
                                //------------ snackbar show --------
                                AppSnackBar.showError(
                                  context,
                                  provider.signupMessage,
                                );
                              }
                            }
                          },
                        ),
                      ),
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
