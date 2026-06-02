import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/auth/checkemail.dart';
import 'package:e_commerce/view/auth/forgetpassword/forgetpassword.dart';
import 'package:e_commerce/view/auth/login.dart';
import 'package:e_commerce/view/auth/forgetpassword/resetpassword.dart';
import 'package:e_commerce/view/auth/signup.dart';
import 'package:e_commerce/view/auth/forgetpassword/success_resetpass.dart';
import 'package:e_commerce/view/auth/success_signup.dart';
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
  AppRoute.successResetPassword:
      (context) =>
          SuccessResetPassword(),
  //=================================
  AppRoute.SignUpSuccess: (context) =>
      SuccessSignUp(),
  //=================================
  AppRoute.checkemail: (context) =>
      CheckEmail(),
  //=================================

  //=====OnBoarding
  AppRoute.onBoarding: (context) =>
      OnBoarding(),

  //=================================
};
