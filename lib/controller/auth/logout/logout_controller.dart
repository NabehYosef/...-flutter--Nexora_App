// lib/controller/auth/logout/logout_controller.dart

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/logout/logout.dart';
import 'package:get/get.dart';

abstract class LogoutController
    extends GetxController {
  void logout();
}

class LogoutControllerImp
    extends LogoutController {
  Statusrequest statusrequest =
      Statusrequest.none;
  LogoutData logoutData = LogoutData(
    Get.find(),
  );
  MyServices myServices = Get.find();

  @override
  void logout() async {
    Get.defaultDialog(
      title: "Log Out ?",
      middleText: "Are you sure ?",
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () async {
        Get.back();

        statusrequest =
            Statusrequest.loading;
        update();

        String token =
            await TokenStorage.getToken();
        print(
          "Token for logout: $token",
        );

        var response = await logoutData
            .post(token);
        print(
          "Logout Response: $response",
        );

        statusrequest = handlingData(
          response,
        );

        if (statusrequest ==
            Statusrequest.success) {
          await TokenStorage.clearToken();
          Get.offAllNamed(
            AppRoute.login,
          );
        } else {
          Get.defaultDialog(
            title: "Error",
            middleText:
                "Error ! please try again",
          );
        }

        update();
      },
    );
  }
}
