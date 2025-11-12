import 'package:blog_app/common_widgets/app_snackbar.dart';
import 'package:blog_app/common_widgets/custom_filled_button.dart';
import 'package:blog_app/features/auth/presentation/login_screen.dart';
import 'package:blog_app/helpers/auth_get_storage.dart';
import 'package:blog_app/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  //await AuthGetStorage.clearUserToken();
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
    );
  }
}
