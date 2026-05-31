import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/test.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //fontFamily: "PlayfairDisplay",
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: AppColor.black,
          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: AppColor.black,
          ),

          bodyMedium: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          bodySmall: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontSize: 14,
          ),
        ),
        // primarySwatch: AppColor.primarycolor,
      ),
      home: OnBoarding(),
      // home: Test(), //
      routes: routes,
    );
  }
}
