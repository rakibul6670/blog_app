import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //--------------- this profile
        CircleAvatar(radius: 20,backgroundColor: Colors.blue,),

        SizedBox(width: 10.w,),

        Expanded(
          child: Column(
            children: [
              //---------------  Name and Comment date ---
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //------------ comment person name ---
                  Text("Liam Walker",
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge,
                  ),

                  SizedBox(width: 5.w,),

                  //------------- comment date ---------
                  Text("2d",
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge!.copyWith(
                        color: Color(0xff9EA6BA),
                        fontWeight: FontWeight.w400
                    ),
                  )

                ],
              ),
              SizedBox(height: 6.h,),
              Text("Great article! I'm particularly interested in the section on renewable energy. Do you have any recommendations for further reading on the topic?",

              )

            ],
          ),
        )
      ],
    );
  }
}