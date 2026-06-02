import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailController
    extends GetxController {
  void checkemail();

  void goToSuccessSignup();
}

class CheckEmailControllerImp
    extends CheckEmailController {
  /// Form Key
  TextEditingController email =
      TextEditingController();

  /// Signup Function
  @override
  void checkemail() {}

  /// Go To Login
  @override
  void goToSuccessSignup() {
    Get.offNamed(
      AppRoute.SignUpSuccess,
    );
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
