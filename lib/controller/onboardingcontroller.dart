import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class OnboardingController
    extends GetxController {
  void next();
  void onPageChanged(int index);
}

class OnBoardingControllerImp
    extends OnboardingController {
  late PageController pageController;

  int currentpage = 0;

  void onInit() {
    pageController = PageController(
      initialPage: 0,
    );
    super.onInit();
  }

  @override
  void next() {
    if (currentpage >
        onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(
        currentpage + 1,
        duration: const Duration(
          milliseconds: 900,
        ),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onPageChanged(int index) {
    currentpage = index;
    update();
  }
}
