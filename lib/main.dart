import 'package:blog_app/constants/app_theme.dart';
import 'package:blog_app/features/blog/presentation/blog_details_screen.dart';
import 'package:blog_app/features/blog/presentation/blog_screen.dart';
import 'package:blog_app/features/bookmark/presentation/bookmarks_screen.dart';
import 'package:blog_app/features/home/presentation/home_screen.dart';
import 'package:blog_app/features/profile/presentation/edit_profile_screen.dart';
import 'package:blog_app/features/profile/presentation/profile_screen.dart';
import 'package:blog_app/features/profile/presentation/update_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_screen.dart';

void main(){
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
      builder: (context,child){
        return BlogApp();
      },
    );
  }
}



class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       //home: OnboardingScreen(),
      //home: UpdatePasswordScreen(),
     // home: EditProfileScreen(),
      //home: BlogScreen(),
      //home: BlogDetailsScreen(),
      //home: HomeScreen(),
     // home: BookmarksScreen(),
      home: ProfileScreen(),
      theme: AppTheme.darkTheme,

    );
  }
}


