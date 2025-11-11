import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSection extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String email;
  final double? radius;
  final String? phone;

  const ProfileSection({
    super.key,
    this.imageUrl,
    required this.name,
    required this.email,
    this.radius,
    this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: radius ?? 50,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xffD07C50),
              onBackgroundImageError: (_, stackTrace) {
                Icon(Icons.broken_image);
              },
              // "https://images.pexels.com/photos/3792581/pexels-photo-3792581.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
              backgroundImage: NetworkImage(imageUrl ?? ""),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        //------------- User Name ---------
        Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22.sp,
              height: 22 / 28,
              color: Colors.white,
            ),
          ),
        ),

        SizedBox(height: 10.h),

        //------------- User Email ---------
        Center(
          child: Text(
            email,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              height: 16 / 24,
              color: Color(0xff9EA6BA),
            ),
          ),
        ),

        phone != null ? SizedBox(height: 10.h) : SizedBox(height: 0),

        //------------- User Occupation ---------
        phone != null
            ? Center(
                child: Text(
                  phone!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    height: 16 / 24,
                    color: Color(0xff9EA6BA),
                  ),
                ),
              )
            : SizedBox(height: 0),
      ],
    );
  }
}
