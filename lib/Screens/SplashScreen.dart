import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentacar/Screens/Dashboard.dart';

import 'package:rentacar/Themes/Theme.dart' as s;


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {


    ScreenUtil.init(context, designSize: const Size(360, 690),minTextAdapt: true);

    TextTheme textTheme=Theme.of(context).textTheme;


    return Scaffold(

      body: ListView(
        children: [

          SizedBox(
            height: 100.h,
          ),
          Image.asset("assets/images/bg_car.png",height: 250.h,width: 800.w,fit: BoxFit.fill,),


          Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: Text("Premium Car.\nEnjoy the Luxury",style: textTheme.headline1,),
          ),

          SizedBox(height: 10.h,),
          Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: Text("Premium and prestige car hourly rental.",style: GoogleFonts.roboto(
              textStyle: textTheme.subtitle2,
              color: Colors.grey,
              fontSize: 16.sp,

            ),),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: Text("Experience a thrill at lower price.",style: GoogleFonts.roboto(
              textStyle: textTheme.subtitle2,
              color: Colors.grey,
              fontSize: 16.sp,

            ),),
          ),

          Container(
            width: double.infinity,
            height: 90.h,
            padding:  EdgeInsets.all(20.w),
            child: ElevatedButton(
                onPressed: (){

                  Get.to(Dashboard());
                 // Get.changeTheme(Get.isDarkMode? s.Theme().lightTheme: s.Theme().dartTheme);
                },
                child: Text("Let's go",style:GoogleFonts.roboto(
                    textStyle: textTheme.headline3,
                    color: Colors.black

                ) ,),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shadowColor: Colors.black,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.r))
                )
              ),

             ),
          )

        ],
      ),

    );  }
}
