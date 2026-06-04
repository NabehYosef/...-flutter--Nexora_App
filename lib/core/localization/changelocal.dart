import 'dart:ui';

import 'package:e_commerce/core/constant/apptheme.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LocalController
    extends GetxController {
  // ignore: non_constant_identifier_names
  Locale? Language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  void changeLanguage(String Language) {
    Locale locale = Locale(Language);
    myServices.sharedPreferences
        .setString(
          "Language",
          Language,
        );
    appTheme = Language == "en"
        ? themeEnglish
        : themeArabic;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices
        .sharedPreferences
        .getString("Language");
    if (sharedPrefLang == "ar") {
      Language = Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      Language = Locale("en");
      appTheme = themeEnglish;
    } else {
      Language = Locale(
        Get.deviceLocale!.languageCode,
      );
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
