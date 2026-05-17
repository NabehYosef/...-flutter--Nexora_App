import 'package:e_commerce/controller/onboardingcontroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/onboarding/custombutton.dart';
import 'package:e_commerce/view/widget/onboarding/customslider.dart';
import 'package:e_commerce/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Padding(
          padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),

          child: Column(
            children: [
              /// Slider Section
              Expanded(
                flex: 4,
                child:
                    CustomSliderOnBoarding(),
              ),

              /// Bottom Section
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                  children: [
                    /// Dots Indicator
                    const CustomDotControllerOnBoarding(),

                    const SizedBox(
                      height: 35,
                    ),

                    /// Button
                    SizedBox(
                      width: double
                          .infinity,
                      height: 55,
                      child:
                          const CustomButtonOnBoarding(),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
