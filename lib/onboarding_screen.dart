import 'package:blog_app/helpers/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_widgets/custom_filled_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //================== body section ================
      body: SafeArea(
        child: Column(
          children: [
            //----------------------- Image Section --------------
            Image.asset(
              "assets/images/onboarding_image.png",
              height: 320.h,
              width: 390.w,
              fit: BoxFit.cover,
            ),

            //-------------- Title -------------------
            SizedBox(height: 20.h,),
            Text(
              "Welcome to Your Personal \n Blog Space",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28.sp,
                color: Colors.white,
              ),
            ),

            //-------------- Sub Title -------------------
            SizedBox(height: 12.h,),
            Text(
              "Discover articles, save your favorites, and engage \n with the community.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),

            //----------- Space ----------
            //SizedBox(height: 266.h),
            Spacer(),

            //--------------- Get Started Button ---------
            CustomFilledButton(buttonName: 'Get Started',
                onPressed: ()=> RouteHelper.navigateToLoginScreen(context),

                ),

            //----------- Space ----------
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
