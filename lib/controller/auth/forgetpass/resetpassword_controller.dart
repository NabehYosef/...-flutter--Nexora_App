// lib/controller/auth/forgetpass/resetpassword_controller.dart

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController
    extends GetxController {
  void resetPassword();
  void goToSuccessResetPassword();
}

class ResetPasswordControllerImp
    extends ResetPasswordController {
  GlobalKey<FormState> formstate =
      GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;

  // ① نستقبل هذي من Verify Screen
  late String token;
  late String otp;

  Statusrequest statusrequest =
      Statusrequest.none;

  ResetPasswordData resetPasswordData =
      ResetPasswordData(Get.find());

  @override
  void resetPassword() async {
    if (password.text.isEmpty ||
        repassword.text.isEmpty) {
      Get.defaultDialog(
        title: "خطأ",
        middleText:
            "يرجى ملء جميع الحقول",
      );
      return;
    }

    if (password.text.length < 6) {
      Get.defaultDialog(
        title: "خطأ",
        middleText:
            "كلمة المرور يجب أن تكون 6 أحرف على الأقل",
      );
      return;
    }

    if (password.text !=
        repassword.text) {
      Get.defaultDialog(
        title: "خطأ",
        middleText:
            "كلمتا المرور غير متطابقتين",
      );
      return;
    }

    statusrequest =
        Statusrequest.loading;
    update();

    var response =
        await resetPasswordData.post(
          otp,
          password.text,
          token,
        );

    print("Reset Response: $response");

    statusrequest = handlingData(
      response,
    );

    if (statusrequest ==
        Statusrequest.success) {
      Get.offAllNamed(AppRoute.login);
    } else {
      Get.defaultDialog(
        title: "خطأ",
        middleText:
            response["message"] ??
            "حدث خطأ، حاول مجدداً",
      );
    }

    update();
  }

  @override
  void goToSuccessResetPassword() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    print(
      "=== ResetPassword onInit START ===",
    );

    password = TextEditingController();
    print(
      "✅ password controller created",
    );

    repassword =
        TextEditingController();
    print(
      "✅ repassword controller created",
    );

    print(
      "arguments = ${Get.arguments}",
    );

    token =
        Get.arguments["token"] ?? "";
    print("✅ token = $token");

    otp = Get.arguments["otp"]
        .toString();
    print("✅ otp = $otp");

    super.onInit();
    print(
      "=== ResetPassword onInit END ===",
    );
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
