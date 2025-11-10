import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackAndTitleRow extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const BackAndTitleRow({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //---------------------- Back Icon ---------
        GestureDetector(
          onTap: onTap ?? () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),

        //-------------- Title ------------
        SizedBox(
          width: 310.w,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
