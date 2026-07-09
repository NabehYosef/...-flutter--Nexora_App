import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/signup/verifycodeSignUp.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController
    extends GetxController {
  checkCode();
  goToSuccessSignUp(
    String verifycodeSignUp,
  );
}

class VerifyCodeSignUpControllerImp
    extends VerifyCodeSignUpController {
  VerifycodeOtp verifycodeOtp =
      VerifycodeOtp(Get.find());

  String? email;
  String? token;

  Statusrequest statusrequest =
      Statusrequest.none;

  @override
  void onInit() {
    print("EMAIL = $email");
    print("TOKEN = $token");
    email = Get.arguments['email'];
    token = Get.arguments['token'];

    super.onInit();
  }

  @override
  checkCode() {
    if (statusrequest ==
        Statusrequest.serverfailure) {
      Get.snackbar(
        "Error",
        "Verification code is incorrect",
      );
      Get.defaultDialog(
        title: "Error",
        middleText:
            "Verification code is incorrect",
      );
    }
  }

  @override
  goToSuccessSignUp(
    String verifycodeSignUp,
  ) async {
    /// check input
    if (verifycodeSignUp.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter verification code",
      );
      return;
    }

    statusrequest =
        Statusrequest.loading;
    update();
    print("VERIFY TOKEN: $token");
    var response = await verifycodeOtp
        .post(
          //  email!,
          verifycodeSignUp,
          token!,
        );

    print("OTP RESPONSE: $response");

    statusrequest = handlingData(
      response,
    );

    if (statusrequest ==
        Statusrequest.success) {
      if (response is Map &&
          response["message"] ==
              "Email verified successfully") {
        Get.offNamed(
          AppRoute.SignUpSuccess,
        );
      } else {
        Get.defaultDialog(
          title: "Error",
          middleText:
              "Verification failed",
        );
        statusrequest =
            Statusrequest.failure;
      }
    }
    print(
      "===== VERIFY OTP DEBUG =====",
    );
    print("email: $email");
    print("otp: $verifycodeSignUp");
    print("token: $token");
    print(
      "============================",
    );
    checkCode();
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
