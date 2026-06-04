import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController
    extends GetxController {
  void checkemail();

  void goToVerifyCode();
}

class ForgetPasswordControllerImp
    extends ForgetPasswordController {
  /// Form Key
  TextEditingController email =
      TextEditingController();

  /// Signup Function
  @override
  void checkemail() {}

  /// Go To Login
  @override
  void goToVerifyCode() {
    Get.offNamed(AppRoute.VerifyCode);
  }

  /// Init
  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  /// Dispose
  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
