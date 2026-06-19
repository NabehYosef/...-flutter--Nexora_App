import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class Mymiddleware
    extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(
    String? route,
  ) {
    if (myServices.sharedPreferences
            .getString("onboarding") ==
        "1") {
      return RouteSettings(
        name: AppRoute.login,
      );
    }
    return null;
  }
}
