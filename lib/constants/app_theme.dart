import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  //================================= Dark Theme =============
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff121217),

    //-------------------- Bottom Navigation Bar Theme -------
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme:IconThemeData(
        color: Colors.white,
      ),
      selectedItemColor: Colors.white,
    ),


    //-------------------- TextTheme ------------
    textTheme: TextTheme(

      //------------- title -------------
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),


      //----------------- Body ----------
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),




    ),

    //--------------- Form Field Theme ------------
    inputDecorationTheme: InputDecorationTheme(
      hintStyle:  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: Color(0xff9EA6BA),
      ),
      contentPadding: EdgeInsets.all(16.r),
      filled: true,
      fillColor: Color(0xff292E38),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
    ),


  );
}
