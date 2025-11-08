
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleIconRow extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icons;

  const TitleIconRow({
    super.key, required this.title, required this.onTap, required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

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

        //----------------------  Icon ---------
        SizedBox(
          width: 48.w,
          child: GestureDetector(
            onTap: onTap,
            child: Icon(icons,size: 25,),
          ),
        ),

      ],
    );
  }
}