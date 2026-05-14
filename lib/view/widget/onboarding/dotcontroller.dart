import 'package:e_commerce/controller/onboardingcontroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/data/datasource/static/static.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomDotControllerOnBoarding
    extends StatelessWidget {
  const CustomDotControllerOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<
      OnBoardingControllerImp
    >(
      builder: (controller) {
        return Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
              (
                index,
              ) => AnimatedContainer(
                margin:
                    const EdgeInsets.only(
                      right: 5,
                    ),
                duration:
                    const Duration(
                      milliseconds: 900,
                    ),
                width:
                    controller
                            .currentpage ==
                        index
                    ? 20
                    : 5,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColor
                      .primarycolor,
                  borderRadius:
                      BorderRadius.circular(
                        10,
                      ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
