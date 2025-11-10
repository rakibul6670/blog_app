import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:blog_app/features/profile/views/show_logout_dialog.dart';
import 'package:blog_app/helpers/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common_widgets/profile_section.dart';
import '../../../common_widgets/title_icon_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //====================== Body Section =================
      body: Column(
        children: [
          SizedBox(height: 28.h),
          //-======================= Back Button and Screen title ================
          TitleIconRow(title: "Profile", onTap: () {}, icons: Icons.settings),

          SizedBox(height: 20.h),

          //======================== Profile Section ==============
          ProfileSection(
            name: 'Elina',
            email: 'elina@mail.com',
            occupation: "Software Developer",
          ),

          //=============================== Form Field Section =================
          SizedBox(height: 16.h),

          //================== Edit Profile ================
          ListTile(
            onTap: () => RouteHelper.navigateToEditProfileScreen(context),
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xff292E38),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.edit, color: Colors.white),
            ),

            //-------------- title -------------
            title: Text("Edit Profile", style: textTheme.titleSmall),
          ),

          //================== Update Password ================
          ListTile(
            onTap: () => RouteHelper.navigateToUpdatePasswordScreen(context),
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xff292E38),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.lock_outline, color: Colors.white),
            ),

            //-------------- title -------------
            title: Text("Update Password", style: textTheme.titleSmall),
          ),
        ],
      ),

      //========================= Logout ==============================
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: CustomFilledButton(
          buttonName: "Logout",
          onPressed: () => showLogOutDialog(context),
        ),
      ),
    );
  }
}
