import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController
    extends GetxController {
  void checkCode();

  void goToSignUpSuccess();
}

class VerifyCodeControllerImp
    extends VerifyCodeController {
  String? email;

  late String? verifycode;

  @override
  void checkCode() {}

  /// Signup Function

  /// Go To Login
  @override
  void goToSignUpSuccess() {
    Get.offNamed(
      AppRoute.SignUpSuccess,
    );
  }

  /// Init
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
