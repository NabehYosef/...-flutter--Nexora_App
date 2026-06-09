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
  GoToForgetPassword();
}

class LoginControllerImp
    extends LoginController {
  GlobalKey<FormState> formstate =
      GlobalKey<FormState>();

  TextEditingController email =
      TextEditingController();

  TextEditingController password =
      TextEditingController();

  bool isShowPassword = true;

  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  login() {
    var formdata =
        formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
    } else {
      print("Not Valid");
    }

    // if (formdata!.validate()) {
    //   formdata.save();
    //   // Get.offNamed(AppRoute);
    // } else {
    //   // ignore: avoid_print
    //   print("Not Valid");
    // }
  }

  @override
  // ignore: non_constant_identifier_names
  GoToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  // ignore: non_constant_identifier_names
  GoToForgetPassword() {
    Get.toNamed(
      AppRoute.forgetPassword,
    );
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
