import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaginationBox extends StatelessWidget {
  final bool active;
  final int pageNumber;

  const PaginationBox({
    super.key,
    required this.active,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: active ? Colors.green : Colors.black12,
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            spreadRadius: 1,
            offset: Offset(2, -2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "$pageNumber",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
