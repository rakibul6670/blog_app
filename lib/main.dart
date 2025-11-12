import 'package:blog_app/constants/app_theme.dart';
import 'package:blog_app/features/home/presentation/home_screen.dart';
import 'package:blog_app/helpers/auth_get_storage.dart';
import 'package:blog_app/provider/blog_provider.dart';
import 'package:blog_app/provider/login_provider.dart';
import 'package:blog_app/provider/profile_provider.dart';
import 'package:blog_app/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'onboarding_screen.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlogApp();
      },
    );
  }
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = AuthGetStorage.getLoginStatus();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignupProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => BlogProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLoggedIn ? HomeScreen() : OnboardingScreen(),
        //home: UpdatePasswordScreen(),
        // home: EditProfileScreen(),
        //home: BlogScreen(),
        //home: BlogDetailsScreen(),
        //home: HomeScreen(),
        // home: BookmarksScreen(),
        // home: ProfileScreen(),
        theme: AppTheme.darkTheme,
      ),
    );
  }
}
