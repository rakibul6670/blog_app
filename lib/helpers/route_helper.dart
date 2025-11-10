import 'package:blog_app/features/blog/presentation/blog_details_screen.dart';
import 'package:blog_app/features/profile/presentation/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/signup_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/profile/presentation/update_password_screen.dart';
import '../onboarding_screen.dart';

class RouteHelper {
  //---------------- Onboarding -----------------
  static void navigateToOnboardingScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => OnboardingScreen()),
    );
  }

  //---------------- Login  -----------------
  static void navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => LoginScreen()),
    );
  }

  //---------------- Signup -----------------
  static void navigateToSignupScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => SignupScreen()),
    );
  }

  //---------------- UpdatePassword Screen  -----------------
  static void navigateToUpdatePasswordScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => UpdatePasswordScreen()),
    );
  }

  //---------------- Home Screen  -----------------
  static void navigateToHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => HomeScreen()),
    );
  }

  //---------------- Edit Profile Screen  -----------------
  static void navigateToEditProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => EditProfileScreen()),
    );
  }

  //---------------- Blog Details Screen  -----------------
  static void navigateToBlogDetailsScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => BlogDetailsScreen()),
    );
  }
}
