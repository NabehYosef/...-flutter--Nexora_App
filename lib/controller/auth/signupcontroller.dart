import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController
    extends GetxController {
  void signup();

  void goToSignIn();
}

class SignUpControllerImp
    extends SignUpController {
  /// Form Key
  TextEditingController email =
      TextEditingController();
  TextEditingController password =
      TextEditingController();
  TextEditingController username =
      TextEditingController();
  TextEditingController phone =
      TextEditingController();

  /// Signup Function
  @override
  void signup() {
    Get.offNamed(AppRoute.checkemail);
  }

  /// Go To Login
  @override
  void goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  /// Init
  @override
  void onInit() {
    username = TextEditingController();

    email = TextEditingController();

    phone = TextEditingController();

    password = TextEditingController();

    super.onInit();
  }

  /// Dispose
  @override
  void dispose() {
    username.dispose();

    email.dispose();

    phone.dispose();

    password.dispose();

    super.dispose();
  }
}
