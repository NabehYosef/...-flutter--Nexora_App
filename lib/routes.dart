import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/auth/login.dart';
import 'package:e_commerce/view/auth/signup.dart';
import 'package:flutter/material.dart';

Map<
  String,
  Widget Function(BuildContext)
>
routes = {
  AppRoute.login: (context) => Login(),
  AppRoute.onBoarding: (context) =>
      Login(),
  AppRoute.signUp: (context) =>
      Signup(),
};
