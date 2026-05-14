import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/routes.dart';
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
        fontFamily: "PlayfairDisplay",
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.black,
          ),
          bodyMedium: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        // primarySwatch: AppColor.primarycolor,
      ),
      home: OnBoarding(),
      routes: routes,
    );
  }
}
