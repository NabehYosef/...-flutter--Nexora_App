import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/login/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class LoginController
    extends GetxController {
  // ignore: strict_top_level_inference
  login();
  checkCode();
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

  MyServices myServices = Get.find();

  @override
  checkCode() {
    if (statusrequest ==
        Statusrequest.serverfailure) {
      Get.snackbar(
        "‼‼ Error",
        "Incorrect email or password",
      );
      Get.defaultDialog(
        title: "Error",
        middleText:
            "Incorrect email or password",
      );
    }
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
          await TokenStorage.setToken(
            response["token"],
          );

          print(
            "✅ Token saved: ${response["token"]}",
          );
          print(
            "ENTERED SUCCESS BLOCK",
          );

          Get.offAllNamed(
            AppRoute.HomePage,
            arguments: {
              "email":
                  response["user"]["email"],
              "password": password.text,
              "userName":
                  response["user"]["userName"],
              "birthDate":
                  response["user"]["birthDate"],
              "phone":
                  response["user"]["phone"],
              "token":
                  response["token"],
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

      checkCode();
      update();
    }
  }

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
    FirebaseMessaging.instance
        .getToken()
        .then((token) {
          print(
            "Firebase Messaging Token: $token",
          );
        })
        .catchError((error) {
          print(
            "Error retrieving Firebase Messaging Token: $error",
          );
        });
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
