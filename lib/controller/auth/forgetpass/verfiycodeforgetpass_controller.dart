// lib/controller/auth/forgetpass/verify_forgetpassword_controller.dart

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/forgetpassword/verifyforgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyForgetPasswordController
    extends GetxController {
  void checkCode();
}

class VerifyForgetPasswordControllerImp
    extends
        VerifyForgetPasswordController {
  // ① نستقبل هذي من Forgot Password
  late String token;
  late String
  otp; // الـ OTP اللي جاء من السيرفر

  // ② المستخدم يكتب هذا
  late TextEditingController otpInput;

  Statusrequest statusrequest =
      Statusrequest.none;

  VerifyForgetPasswordData verifyData =
      VerifyForgetPasswordData(
        Get.find(),
      );

  //late TextEditingController otpInput;

  @override
  void onInit() {
    otpInput =
        TextEditingController(); // ✅
    token =
        Get.arguments["token"] ?? "";
    otp = Get.arguments["otp"]
        .toString();
    super.onInit();
  }

  @override
  void checkCode() async {
    print("=== OTP DEBUG ===");
    print("من السيرفر: '$otp'");
    print(
      "كتبه المستخدم: '${otpInput.text.trim()}'",
    );
    print(
      "متطابقين؟ ${otpInput.text.trim() == otp}",
    );
    // ③ نقارن اللي كتبه المستخدم مع اللي جاء من السيرفر
    if (otpInput.text.trim() == otp) {
      // ④ صح → روح لـ Reset Password وحمل الـ token معك
      Get.offNamed(
        AppRoute.ResetPassword,
        arguments: {
          "token": token,
          "otp": otp,
        },
      );
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText:
            "This Code isnt Correct",
      );
    }
  }

  @override
  void dispose() {
    otpInput.dispose();
    super.dispose();
  }
}
