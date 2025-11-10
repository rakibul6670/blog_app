import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/back_and_title_row.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //================= body section ===========
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //---------------- back icon ----------
                BackAndTitleRow(title: 'Update Password'),

                SizedBox(height: 20.h),
                //--------------------- User Field Title  ---------------
                Text(
                  "Current Password",
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
                  decoration: InputDecoration(
                    hintText: "Enter your current password",
                  ),
                ),

                SizedBox(height: 12.h),

                //--------------------- Password Field Title  ---------------
                Text(
                  "New Password",
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
                    hintText: "Enter your new password",
                  ),
                ),
                SizedBox(height: 12.h),

                //--------------------- confirm password Field Title  ---------------
                Text(
                  "Confirm New Password",
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
                    hintText: "Enter your new password",
                  ),
                ),

                //------------- space ---
                Spacer(),
                //-------------------------  Signup Button ---------------------------
                CustomFilledButton(
                  buttonName: "Update Password",
                  onPressed: () {},
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
