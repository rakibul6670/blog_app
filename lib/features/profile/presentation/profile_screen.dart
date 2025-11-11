import 'package:blog_app/common_widgets/app_snackbar.dart';
import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:blog_app/features/auth/presentation/login_screen.dart';
import 'package:blog_app/features/profile/model/user_profile_model.dart';
import 'package:blog_app/helpers/auth_get_storage.dart';
import 'package:blog_app/helpers/profile_get_storage.dart';
import 'package:blog_app/helpers/route_helper.dart';
import 'package:blog_app/provider/login_provider.dart';
import 'package:blog_app/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../common_widgets/profile_section.dart';
import '../../../common_widgets/title_icon_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // //---------------- user profiel model -------
  // UserProfileModel? userProfileModel;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      context.read<ProfileProvider>().getProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //======================== App Bar Section ===============
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontSize: 20)),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.bookmark_outline_sharp, size: 25),
          ),
          //-----------space
          SizedBox(width: 16.h),
        ],
      ),

      //====================== Body Section =================
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              SizedBox(height: 28.h),

              // //-======================= Back Button and Screen title ================
              // TitleIconRow(
              //   title: "Profile",
              //   onTap: () {},
              //   icons: Icons.settings,
              // ),

              // SizedBox(height: 20.h),

              //======================== Profile Section ==============
              ProfileSection(
                name: provider.userProfileModel?.name ?? "Unknown",
                email: provider.userProfileModel?.email ?? "unknown email",
                phone: provider.userProfileModel?.phone ?? "unknown number",
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
                onTap: () =>
                    RouteHelper.navigateToUpdatePasswordScreen(context),
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
          );
        },
      ),

      //========================= Logout ==============================
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Consumer<LoginProvider>(
          builder: (context, provider, child) {
            return Visibility(
              visible: provider.logoutLoading == false,
              replacement: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              child: CustomFilledButton(
                buttonName: "Logout",
                onPressed: () async {
                  await provider.logout();
                  if (provider.isLogout) {
                    await AuthGetStorage.clearUserToken();
                    AppSnackBar.showSuccess(context, provider.logoutMessage);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (predicate) => false,
                    );
                  } else {
                    AppSnackBar.showSuccess(context, provider.logoutMessage);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
