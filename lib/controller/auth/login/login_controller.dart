import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/login/login.dart';
import 'package:e_commerce/view/auth/forgetpassword/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
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
  Statusrequest? statusrequest;
  LoginData logindata = LoginData(
    Get.find(),
  );
  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!
        .validate()) {
      statusrequest =
          Statusrequest.loading;
      update();

      var response = await logindata
          .post(
            email.text,
            password.text,
          );

      print(response);

      statusrequest = handlingData(
        response,
      );
      print(
        "AFTER handlingData: $statusrequest",
      );

      if (statusrequest ==
          Statusrequest.success) {
        if (response is Map &&
            response.containsKey(
              "user",
            )) {
          print(
            "ENTERED SUCCESS BLOCK",
          );
          Get.offAllNamed(
            AppRoute.Home,
            arguments: {
              "email":
                  response["user"]["email"],
              "password": password.text,
              "token":
                  response["token"],
              "userName":
                  response["user"]["userName"],
            },
          );
        } else {
          statusrequest =
              Statusrequest.failure;
          Get.defaultDialog(
            title: "Error",
            middleText:
                "Unexpected server response",
          );
        }
      }

      update();
    }
  }

  // if (formdata!.validate()) {
  //   formdata.save();
  //   // Get.offNamed(AppRoute);
  // } else {
  //   // ignore: avoid_print
  //   print("Not Valid");
  // }

  @override
  // ignore: non_constant_identifier_names
  GoToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  // ignore: non_constant_identifier_names
  GoToForgetPassword() {
    statusrequest = Statusrequest.none;
    Get.toNamed(
      AppRoute.Forgetpassword,
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
