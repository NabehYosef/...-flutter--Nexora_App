import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/forgetpassword/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController
    extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp
    extends ForgetPasswordController {
  GlobalKey<FormState> formstate =
      GlobalKey<FormState>();

  late TextEditingController email;

  Statusrequest statusrequest =
      Statusrequest.none;

  ForgetPasswordData
  forgetPasswordData =
      ForgetPasswordData(Get.find());

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

      statusrequest = handlingData(
        response,
      );

      if (statusrequest ==
          Statusrequest.success) {
        if (response["message"] ==
            "OTP sent to email") {
          Get.offNamed(
            AppRoute.VerifyCode,
            arguments: {
              "email": email.text,
              "token":
                  response["token"],
            },
          );
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText:
                response["message"],
          );

          statusrequest =
              Statusrequest.failure;
        }
      }

      update();
    } else {
      print("Not Valid");
    }
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
