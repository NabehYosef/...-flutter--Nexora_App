import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class LoginController
    extends GetxController {
  // ignore: strict_top_level_inference
  login();
  GoToSignUp();
}

class LoginControllerImp
    extends LoginController {
  TextEditingController email =
      TextEditingController();
  TextEditingController password =
      TextEditingController();
  @override
  login() {}

  @override
  // ignore: non_constant_identifier_names
  GoToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
