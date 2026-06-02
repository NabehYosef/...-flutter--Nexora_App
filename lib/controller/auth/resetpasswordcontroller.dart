import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController
    extends GetxController {
  void resetPassword();

  void goToSuccessResetPassword();
}

class ResetPasswordControllerImp
    extends ResetPasswordController {
  /// Form Key
  late TextEditingController password;
  late TextEditingController repassword;

  /// Signup Function
  @override
  void resetPassword() {}

  /// Go To Login
  @override
  void goToSuccessResetPassword() {
    Get.offNamed(
      AppRoute.successResetPassword,
    );
  }

  /// Init
  @override
  void onInit() {
    password = TextEditingController();
    repassword =
        TextEditingController();

    super.onInit();
  }

  /// Dispose
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
