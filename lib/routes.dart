import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/auth/forgetpassword.dart';
import 'package:e_commerce/view/auth/login.dart';
import 'package:e_commerce/view/auth/resetpassword.dart';
import 'package:e_commerce/view/auth/signup.dart';
import 'package:e_commerce/view/auth/verifycode.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<
  String,
  Widget Function(BuildContext)
>
routes = {
  //======Auth
  AppRoute.login: (context) => Login(),
  //=================================
  AppRoute.signUp: (context) =>
      Signup(),
  //=================================
  AppRoute.forgetPassword: (context) =>
      Forgetpassword(),
  //=================================
  AppRoute.VerifyCode: (context) =>
      VerifyCode(),
  //=================================
  AppRoute.ResetPassword: (context) =>
      Resetpassword(),
  //=================================
  //=====OnBoarding
  AppRoute.onBoarding: (context) =>
      OnBoarding(),
  //=================================
};
