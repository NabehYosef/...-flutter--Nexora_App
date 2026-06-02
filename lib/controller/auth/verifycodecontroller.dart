import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController
    extends GetxController {
  void checkCode();

  void goToResetPassword();
}

class VerifyCodeControllerImp
    extends VerifyCodeController {
  /// Form Key
  TextEditingController email =
      TextEditingController();

  late String? verifycode;

  @override
  void checkCode() {}

  /// Signup Function

  /// Go To Login
  @override
  void goToResetPassword() {
    Get.offNamed(
      AppRoute.ResetPassword,
    );
  }

  /// Init
  @override
  void onInit() {
    super.onInit();
  }
}
