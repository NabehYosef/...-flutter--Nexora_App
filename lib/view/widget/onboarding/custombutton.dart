import 'package:e_commerce/controller/onboardingcontroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomButtonOnBoarding
    extends
        GetView<
          OnBoardingControllerImp
        > {
  const CustomButtonOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 30,
      ),
      height: 40,
      child: Container(
        margin:
            const EdgeInsets.symmetric(
              horizontal: 50,
            ),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(40),
        ),
        child: MaterialButton(
          padding:
              const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 0,
              ),
          textColor: Colors.white,
          onPressed: () {
            controller.next();
          },
          color: AppColor.primarycolor,
          child: const Text("Continue"),
        ),
      ),
    );
  }
}
