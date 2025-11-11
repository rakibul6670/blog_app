import 'package:blog_app/common_widgets/app_snackbar.dart';
import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:blog_app/helpers/validator.dart';
import 'package:blog_app/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/back_and_title_row.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      //================= body section ===========
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          child: Consumer<ProfileProvider>(
            builder: (context, provider, child) {
              return Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //---------------- back icon ----------
                    BackAndTitleRow(title: 'Update Password'),

                    SizedBox(height: 20.h),
                    //--------------------- User Field Title  ------------------------
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

                    //------- Current Password Field ------
                    TextFormField(
                      obscureText: provider.isCurrentPasswordHide,
                      controller: provider.currentPasswordController,
                      validator: Validator.validatePassword,
                      decoration: InputDecoration(
                        hintText: "Enter your current password",
                        suffix: GestureDetector(
                          onTap: () => provider.currentPasswordToggle(),
                          child: Icon(
                            provider.isCurrentPasswordHide
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    //--------------------- New Password Field --------------------------
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
                    //------ Password  Field -----------
                    TextFormField(
                      obscureText: provider.isNewPasswordHide,
                      controller: provider.newPasswordController,
                      validator: Validator.validatePassword,
                      decoration: InputDecoration(
                        hintText: "Enter your new password",
                        suffix: GestureDetector(
                          onTap: () => provider.newPasswordToggle(),
                          child: Icon(
                            provider.isNewPasswordHide
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),

                    //------------- space ---
                    Spacer(),
                    //-------------------------  Signup Button ---------------------------
                    Visibility(
                      visible: provider.changePasswordLoading == false,
                      replacement: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                      child: CustomFilledButton(
                        buttonName: "Update Password",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await provider.updatePassword();

                            if (provider.isPasswordUpdated) {
                              provider.clearChangePasswordFields();

                              AppSnackBar.showSuccess(
                                context,
                                provider.changePasswodMessage,
                              );
                            } else {
                              AppSnackBar.showError(
                                context,
                                provider.changePasswodMessage,
                              );
                            }
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
