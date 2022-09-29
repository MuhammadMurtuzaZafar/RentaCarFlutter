import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Step StepFour(context)
{
  TextTheme textTheme=Theme.of(context).textTheme;

  return  Step(
    title:  Text('Confirmation',style:GoogleFonts.roboto(
        textStyle: textTheme.headline4,
        fontWeight: FontWeight.w500
    ) ,),
    content: Container(
        alignment: Alignment.centerLeft,
        child: Column(
        children: [
          Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("By clicking ",style: textTheme.headline6,),
                  Text("Book Now ",style: textTheme.headline5,),
                ],
              ),
              Text("You agree to our Terms and Conditions. ",style: textTheme.headline6,),

              SizedBox(height: 15.h,),

              MaterialButton(
                color: Colors.blue,
                height: 56.h,
                minWidth: 300.w,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                onPressed: (){



                },child: Text("Book Now",  style: GoogleFonts.roboto(
                  textStyle: textTheme.headline4, color: Colors.white),),),

            ],
          ),
],
        )
),
  );
}