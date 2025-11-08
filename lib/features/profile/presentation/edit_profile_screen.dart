import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/back_and_title_row.dart';
import '../../../common_widgets/profile_section.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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

                //-======================= Back Button and Screen title ================
                BackAndTitleRow(title: 'Edit Profile', onTap: () {  },),

                SizedBox(height: 20.h,),

                //======================== Profile Section ==============
                 ProfileSection(name: 'Elina', email: 'elina@mail.com',),

                //=============================== Form Field Section =================
                SizedBox(height: 16.h),
                //------- Display Field Title  ----
                Text(
                  "Display Name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    height: 24 / 16,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 8.h),
                //---------------- Display Form Field -----------
                TextFormField(
                  // controller: ,
                  // validator: ,
                  decoration: InputDecoration(hintText: "Enter your display name"),
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
                //---------------- Password Form Field -----------
                TextFormField(
                  // controller: ,
                  // validator: ,
                  decoration: InputDecoration(hintText: "Enter your email"),
                ),
                SizedBox(height: 12.h),

                //--------------------- confirm password Field Title  ---------------
                Text(
                  "Bio",
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
                  maxLines: 6,
                  maxLength: 150,
                  decoration: InputDecoration(

                    hintText: "Enter your bio",
                  ),
                ),

                //------------- space ---
                Spacer(),
                //-------------------------  Signup Button ---------------------------
                CustomFilledButton(buttonName: "Save Changes", onPressed: () {}),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


