import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteCommentSecton extends StatelessWidget {
  const WriteCommentSecton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),

      child: Row(
        children: [
          //--------------- user profile ---------------
          CircleAvatar(radius: 20.r, backgroundColor: Colors.orange),

          SizedBox(width: 10.w),
          //--------------- Write Comment ----------
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Write your comment ",
                suffixIcon: GestureDetector(
                  child: Icon(Icons.send, color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
