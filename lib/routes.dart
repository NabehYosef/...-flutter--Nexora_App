import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/auth/forgetpassword/forgetpassword.dart';
import 'package:e_commerce/view/auth/login.dart';
import 'package:e_commerce/view/auth/forgetpassword/resetpassword.dart';
import 'package:e_commerce/view/auth/signup.dart';
import 'package:e_commerce/view/auth/forgetpassword/success_resetpass.dart';
import 'package:e_commerce/view/auth/success_signup.dart';
import 'package:e_commerce/view/auth/verifycode.dart';
import 'package:e_commerce/view/auth/verifysighup.dart';
import 'package:e_commerce/view/screen/language.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<
  String,
  Widget Function(BuildContext)
>
routes = {
  //Language
  AppRoute.language: (context) =>
      Language(),
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
  AppRoute.successResetPassword:
      (context) =>
          SuccessResetPassword(),
  //=================================
  AppRoute.SignUpSuccess: (context) =>
      SuccessSignUp(),
  //=================================

  //=================================
  AppRoute.VerifyCodeSignup:
      (context) => VerifyCodeSignup(),

  //=====OnBoarding
  AppRoute.onBoarding: (context) =>
      OnBoarding(),

  //=================================
};
