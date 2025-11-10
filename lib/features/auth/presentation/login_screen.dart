import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:blog_app/helpers/route_helper.dart';
import 'package:blog_app/helpers/validator.dart';
import 'package:blog_app/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/back_and_title_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //================= body section ===========
      body: ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
            child: SingleChildScrollView(
              child: Consumer<LoginProvider>(
                builder: (context, provider, child) {
                  return Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        //---------------- back icon ----------
                        BackAndTitleRow(title: 'Sign in'),

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
                      
                          controller: provider.emailController,
                          validator: Validator.validateEmail,
                          decoration: InputDecoration(
                            hintText: "enter your Email",
                          ),
                        ),

                        SizedBox(height: 12.h),

                        //---------------- Password Form Field -----------
                        TextFormField(
                          controller: provider.passwordController,
                          validator: Validator.validatePassword,
                          decoration: InputDecoration(hintText: "password"),
                        ),

                        //------------- space ---
                        SizedBox(height: 49.h),

                        //---------------------- Signup Button ---------------------------
                        CustomFilledButton(
                          buttonName: "Sign in",
                          onPressed: () {
                            provider.login();
                            if (provider.isLoggedIn) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: const Color.fromARGB(255, 233, 10, 10),

                                  content: Text(provider.loginMessage,style: TextStyle(color: const Color.fromARGB(255, 50, 212, 10)),)));
                              //----------- loggin successful -----
                              RouteHelper.navigateToSignupScreen(context);
                            }
                            else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: const Color.fromARGB(255, 233, 10, 10),

                                  content: Text(provider.loginMessage,style: TextStyle(color: const Color.fromARGB(255, 50, 212, 10)),)));

                            }
                          },
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
      ),
    );
  }
}
