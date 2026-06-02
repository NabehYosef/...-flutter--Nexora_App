import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
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
);

ThemeData themArabic = ThemeData(
  fontFamily: "Cairo",
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
);
