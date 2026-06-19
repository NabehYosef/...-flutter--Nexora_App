import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/sighnup.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController
    extends GetxController {
  // ignore: strict_top_level_inference
  signUp();
  // ignore: strict_top_level_inference
  goToSignIn();
}

class SignUpControllerImp
    extends SignUpController {
  GlobalKey<FormState> formstate =
      GlobalKey<FormState>();

  late TextEditingController usernName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  // ignore: non_constant_identifier_names
  late TextEditingController birthDate;

  Statusrequest? statusRequest;
  bool isShowPassword = true;

  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  SignUpData signupData = SignUpData(
    Get.find(),
  );

  List data = [];

  @override
  signUp() async {
    if (formstate.currentState!
        .validate()) {
      statusRequest =
          Statusrequest.loading;
      update();

      var response = await signupData
          .post(
            email.text,
            usernName.text,
            password.text,
            phone.text,
            birthDate.text,
          );

      print(response);

      statusRequest = handlingData(
        response,
      );

      if (statusRequest ==
          Statusrequest.success) {
        if (response is Map &&
            response.containsKey(
              "data",
            )) {
          Get.offNamed(
            AppRoute.VerifyCodeSignup,
            arguments: {
              "email":
                  response["data"]["email"],
              "userId":
                  response["data"]["userId"],
              "token":
                  response["data"]["token"],
              "otp":
                  response["data"]["otp"],
            },
          );
        } else {
          statusRequest =
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

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    usernName = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    birthDate = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    usernName.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    birthDate.dispose();
    super.dispose();
  }
}
