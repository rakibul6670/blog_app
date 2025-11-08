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

  //---------------- UpdatePassword Screen  -----------------
  static void navigateToHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => HomeScreen()),
    );
  }

}
