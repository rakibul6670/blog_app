import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BlogAndBloggerDetails extends StatelessWidget {
  const BlogAndBloggerDetails({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [

            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
            ),

            SizedBox(width: 10.w,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //--------------- Blogger details -----
                  Text("Author",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                    ,style:textTheme.titleSmall,),
                  //----------------- Blogger name ------------
                  Text("Olivia Harper",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                    ,style:textTheme.titleSmall,),

                ],
              ),
            )



          ],
        ),

        SizedBox(height: 4.h,),
        //---------------- Blog Details  -------------
        Text("In a world increasingly aware of its environmental footprint, the concept of sustainable living has moved from a niche lifestyle to a mainstream necessity. This article explores the innovative approaches and technologies that are shaping a greener future, from renewable energy solutions to eco-friendly consumer products.",
          //overflow: TextOverflow.ellipsis
          style:textTheme.bodyMedium,
        ),
        //--------------------------- Like and Comment ------------
        Container(
          height: 56.h,
          width: 390.w,
          //-16,28,
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Row(
            children: [

              //--------------- Favorite ----------
              GestureDetector(
                  onTap:(){},
                  child: Icon(Icons.favorite_border,size: 20,)
              ),


              SizedBox(width: 2.w,),
              //--------------- total Like ------------
              Text("123"),


              //--------------- Comment Icon  ----------
              SizedBox(width: 28.w,),
              GestureDetector(
                  onTap:(){},
                  child: Icon(Icons.comment_rounded,size: 20,)
              ),


              SizedBox(width: 2.w,),
              //--------------- total Like ------------
              Text("43"),
            ],
          ),
        ),

      ],
    );
  }
}
