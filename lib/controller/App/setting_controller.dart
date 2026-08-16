import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController
    extends GetxController {
  MyServices myServices = Get.find();

  confirmLogout() {
    Get.dialog(
      AlertDialog(
        title: const Text(
          "تسجيل الخروج",
        ),
        content: const Text(
          "هل أنت متأكد من تسجيل الخروج؟",
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              logout();
            },
            child: const Text(
              "تسجيل الخروج",
            ),
          ),
        ],
      ),
    );
  }

  logout() {
    myServices.sharedPreferences
        .clear();
    Get.offAllNamed(AppRoute.login);
  }
}
