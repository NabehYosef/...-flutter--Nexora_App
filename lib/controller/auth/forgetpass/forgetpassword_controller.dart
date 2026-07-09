import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/forgetpassword/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController
    extends GetxController {
  checkemail();
  checkCode();
}

class ForgetPasswordControllerImp
    extends ForgetPasswordController {
  GlobalKey<FormState> formstate =
      GlobalKey<FormState>();

  late TextEditingController email;

  Statusrequest statusrequest =
      Statusrequest.none;

  dynamic lastResponse;

  ForgetPasswordData
  forgetPasswordData =
      ForgetPasswordData(Get.find());

  @override
  checkCode() {
    if (statusrequest ==
        Statusrequest.serverfailure) {
      String message =
          "Email not found";
      if (lastResponse is Map &&
          lastResponse["message"] !=
              null) {
        message =
            lastResponse["message"];
      }
      Get.snackbar("Error", message);
    }
  }

  @override
  Future<void> checkemail() async {
    if (formstate.currentState!
        .validate()) {
      statusrequest =
          Statusrequest.loading;

      update();

      var response =
          await forgetPasswordData.post(
            email.text,
          );

      lastResponse = response;

      statusrequest = handlingData(
        response,
      );

      if (statusrequest ==
          Statusrequest.success) {
        if (response is Map &&
            response.containsKey(
              "token",
            )) {
          Get.offNamed(
            AppRoute.VerifyCode,
            arguments: {
              "otp": response["otp"],
              "token":
                  response["token"],
            },
          );
        }
      } else {
        Get.defaultDialog(
          title: "⚠️ Warning".tr,
          middleText: response is Map
              ? (response["message"] ??
                    "Email not found")
              : "Email Not Found ⚠️".tr,
        );

        statusrequest =
            Statusrequest.failure;
      }
    }

    checkCode();
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
