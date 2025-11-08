import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomFilledButton extends
StatelessWidget {
  final double? height;
  final double? width;
  final String buttonName;
  final VoidCallback onPressed;

  const CustomFilledButton({
    super.key, this.height, this.width, required this.buttonName, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  height?? 48.h,
      width:width?? 358.w,
      child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xffE36527),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle:  TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          child: Center(child: Text(buttonName))),
    );
  }
}