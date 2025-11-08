import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/back_and_title_row.dart';

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
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor: Color(0xffD07C50),
                      onBackgroundImageError: (_,stackTrace){
                        Icon(Icons.broken_image);
                      },
                      backgroundImage: NetworkImage("https://images.pexels.com/photos/3792581/pexels-photo-3792581.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                //------------- User Name ---------
                Center(
                  child: Text(
                    "Sophia Carter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp,
                      height: 22 / 28,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                //------------- User Email ---------
                Center(
                  child: Text(
                    "sophia@gmail.com",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      height: 16 / 24,
                      color: Color(0xff9EA6BA),
                    ),
                  ),
                ),






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

