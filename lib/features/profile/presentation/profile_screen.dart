import 'package:blog_app/features/profile/model/user_profile_model.dart';
import 'package:blog_app/features/profile/views/logout_section.dart';
import 'package:blog_app/helpers/profile_get_storage.dart';
import 'package:blog_app/helpers/route_helper.dart';
import 'package:blog_app/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';
import '../../../common_widgets/profile_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // //---------------- user profiel model -------
  UserProfileModel? userProfileModel;

  @override
  void initState() {
    super.initState();
    userProfileModel = ProfileGetStorage.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final Logger logger = Logger();
    logger.i("User Data have get storage : ${userProfileModel!.name}");

    return Scaffold(
      //======================== App Bar Section ===============
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),

      //====================== Body Section =================
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              SizedBox(height: 28.h),
              //======================== Profile Section ==============
              ProfileSection(
                name: userProfileModel!.name,
                email: userProfileModel!.email,
                phone: userProfileModel!.phone,
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
      bottomNavigationBar: LogoutSection(),
    );
  }
}
