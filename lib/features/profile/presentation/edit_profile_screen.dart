import 'package:blog_app/common_widgets/app_snackbar.dart';
import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:blog_app/features/profile/model/user_profile_model.dart';
import 'package:blog_app/helpers/profile_get_storage.dart';
import 'package:blog_app/helpers/validator.dart';
import 'package:blog_app/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/back_and_title_row.dart';
import '../../../common_widgets/profile_section.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  //---------------- user profiel model -------
  //UserProfileModel? userProfileModel;

  // @override
  // void initState() {
  //   super.initState();
  //   Future.microtask(() async {
  //     context.read<ProfileProvider>().getProfileData();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //================= body section ===========
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          child: Consumer<ProfileProvider>(
            builder: (context, provider, child) {
              return Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //-======================= Back Button and Screen title ================
                    BackAndTitleRow(
                      title: 'Edit Profile',
                      onTap: () {
                        Navigator.pop(context);
                        provider.clearProfileUpdateFields();
                      },
                    ),

                    SizedBox(height: 20.h),

                    //======================== Profile Section ==============
                    ProfileSection(
                      name: provider.userProfileModel?.name ?? "Unknown",
                      email:
                          provider.userProfileModel?.email ?? "unknown email",
                    ),

                    //=============================== Form Field Section =================
                    SizedBox(height: 16.h),

                    //--------------------- Name Field Title  ---------------
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
                    //---------------- Name Form Field -----------
                    TextFormField(
                      controller: provider.nameController,
                      validator: Validator.validatename,
                      decoration: InputDecoration(hintText: "Enter your name"),
                    ),
                    SizedBox(height: 12.h),

                    //--------------------- phone password Field Title  ---------------
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
                    //---------------- phone Form Field -----------
                    TextFormField(
                      controller: provider.phoneController,
                      validator: Validator.validatePhone,
                      decoration: InputDecoration(
                        hintText: "Enter your phone number",
                      ),
                    ),

                    //------------- space ---
                    Spacer(),
                    //-------------------------  Signup Button ---------------------------
                    Visibility(
                      visible: provider.profileUpdateLoading == false,
                      replacement: Center(
                        child: CircularProgressIndicator(color: Colors.amber),
                      ),
                      child: CustomFilledButton(
                        buttonName: "Save Changes",
                        onPressed: () async {
                          await provider.updateProfile();
                          if (provider.isProfileUpdated) {
                            //------ clear field -----
                            provider.clearProfileUpdateFields();

                            AppSnackBar.showSuccess(
                              context,
                              provider.profileUpdateMessage,
                            );
                          } else {
                            AppSnackBar.showError(
                              context,
                              provider.profileUpdateMessage,
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
