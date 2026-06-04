import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/onboarding/custombutton.dart';
import 'package:e_commerce/view/widget/onboarding/customslider.dart';
import 'package:e_commerce/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class OnBoarding
    extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor:
          AppColor.backgroundcolor,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 4,
              child:
                  CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
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
