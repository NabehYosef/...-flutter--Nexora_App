import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class ResetPasswordController
    extends GetxController {
  void goToResetPassowrd();
}

class ResetPasswordControllerImp
    extends ResetPasswordController {
  /// Form Key
  late TextEditingController password;
  late TextEditingController repassword;

  Key? get formstate => null;

  /// Signup Function
  ResetPasswordData resetPasswordData =
      ResetPasswordData(Get.find());
  Statusrequest? statusrequest;

  /// Go To Login
  @override
  void goToResetPassowrd() {
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

  void goToSuccessResetPassword() {}
}
