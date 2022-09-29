import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentacar/Home.dart';
import 'package:rentacar/Screens/Dashboard.dart';
import 'package:rentacar/Screens/DetailScreen.dart';
import 'package:rentacar/Themes/Theme.dart' as s;

import 'Screens/SplashScreen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690),minTextAdapt: true);

    return GetMaterialApp(
       theme: s.Theme().lightTheme,
      darkTheme: s.Theme().dartTheme,
      // themeMode: ThemeMode.dark,
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

