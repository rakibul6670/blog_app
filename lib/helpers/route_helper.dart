import 'package:blog_app/features/blog/presentation/blog_details_screen.dart';
import 'package:blog_app/features/profile/presentation/edit_profile_screen.dart';
import 'package:flutter/material.dart';
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
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
  }

  //---------------- Login  -----------------
  static void navigateToLoginScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  static void removeAllToLoginScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (predicate) => false,
    );
  }

  //---------------- Signup -----------------
  static void navigateToSignupScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  //---------------- UpdatePassword Screen  -----------------
  static void navigateToUpdatePasswordScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdatePasswordScreen()),
    );
  }

  //---------------- Home Screen  -----------------
  static void navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  //---------------- Edit Profile Screen  -----------------
  static void navigateToEditProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfileScreen()),
    );
  }

  //---------------- Blog Details Screen  -----------------
  // static void navigateToBlogDetailsScreen(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => BlogDetailsScreen()),
  //   );
  // }
}
