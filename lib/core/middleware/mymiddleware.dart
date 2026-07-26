import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware
    extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(
    String? route,
  ) {
    String? token = myServices
        .sharedPreferences
        .getString(
          TokenStorage.authTokenKey,
        );
    print(
      "🔍 Middleware | route: $route | token: $token",
    );

    if (token != null &&
        token.isNotEmpty) {
      return RouteSettings(
        name: AppRoute.HomePage,
      );
    }

    String? onboarding = myServices
        .sharedPreferences
        .getString("onboarding");

    if (onboarding == null) {
      return RouteSettings(
        name: AppRoute.onBoarding,
      );
    }
    return null;
  }
}
