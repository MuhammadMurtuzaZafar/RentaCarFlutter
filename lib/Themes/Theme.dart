import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Theme
{


  final dartTheme=ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey[300],
    canvasColor: Colors.white,

    appBarTheme: AppBarTheme(

      color: Color(0xd5353b3d)
    ),
    scaffoldBackgroundColor: Color(0xd5353b3d),
    hoverColor:Colors.white ,

    indicatorColor:Color(0xd5202326) ,
    cardColor: Color(0xd5202326),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(



      headline1: GoogleFonts.lato(
        fontSize: 24.sp,
        color: Colors.white,
        fontWeight: FontWeight.w900
      ),

      headline2: GoogleFonts.lato(
          fontSize: 22.sp,
          color: Colors.white,
          fontWeight: FontWeight.w800
      ),

      headline3: GoogleFonts.lato(
          fontSize: 20.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600
      ),

      headline4: GoogleFonts.lato(
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w400
      ),

      headline5:   GoogleFonts.lato(
        fontSize: 16.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400
    ),

    headline6:   GoogleFonts.lato(
      fontSize: 14.sp,
      color: Colors.white,
      ) ,
      caption:  GoogleFonts.lato(
          fontSize: 14.sp,
          color: Colors.white,
      ) ,
      subtitle2:  GoogleFonts.lato(
          fontSize: 10.sp,
          color: Colors.white,
      ) ,
      subtitle1:  GoogleFonts.lato(
          fontSize: 12.sp,
          color: Colors.white,
      ) ,











    )
  );

  final lightTheme=ThemeData.light().copyWith(

      primaryColor: Colors.white,
      hoverColor:Color(0xd5202326) ,
      indicatorColor:Colors.white ,
      iconTheme: IconThemeData(color:Color(0xd5202326)),
      scaffoldBackgroundColor: Colors.white,

      textTheme: TextTheme(


        headline1: GoogleFonts.lato(
            fontSize: 24.sp,
            color: Colors.black,
            fontWeight: FontWeight.w900
        ),

        headline2: GoogleFonts.lato(
            fontSize: 22.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400
        ),

        headline3: GoogleFonts.lato(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400
        ),

        headline4: GoogleFonts.lato(
            fontSize: 18.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400
        ),

        headline5:   GoogleFonts.lato(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400
        ),

        headline6:   GoogleFonts.lato(
          fontSize: 14.sp,
          color: Colors.black,
        ) ,
        caption:  GoogleFonts.lato(
          fontSize: 14.sp,
          color: Colors.black,
        ) ,
        subtitle2:  GoogleFonts.lato(
          fontSize: 10.sp,
          color: Colors.black,
        ) ,
        subtitle1:  GoogleFonts.lato(
          fontSize: 12.sp,
          color: Colors.black,
        ) ,











      )

  );
}