import 'package:e_commerce/controller/onboardingcontroller.dart';
import 'package:e_commerce/view/widget/onboarding/custombutton.dart';
import 'package:e_commerce/view/widget/onboarding/dotcontroller.dart';
import 'package:e_commerce/view/widget/onboarding/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

// ignore: must_be_immutable
class OnBoarding
    extends StatelessWidget {
  const OnBoarding({super.key});

  //OnBoardingControllerImp controller =Get.lazyPut(()=>OnBoardingControllerImp(),fenix: true);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child:
                  CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  CustomDotControllerOnBoarding(),
                  Spacer(flex: 2),
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
