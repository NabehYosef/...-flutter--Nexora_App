import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomSliderOnBoarding
    extends
        GetView<
          OnBoardingControllerImp
        > {
  const CustomSliderOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller:
          controller.pageController,

      onPageChanged: (value) {
        controller.onPageChanged(value);
      },

      itemCount: onBoardingList.length,

      itemBuilder: (context, i) =>
          Column(
            children: [
              Image.asset(
                onBoardingList[i]
                    .image!,
                width: 200,
                height: 230,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                onBoardingList[i]
                    .title!,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                alignment:
                    Alignment.center,
                child: Text(
                  onBoardingList[i]
                      .body!,
                  textAlign:
                      TextAlign.center,
                  style:
                      Theme.of(context)
                          .textTheme
                          .bodyMedium,
                ),
              ),
            ],
          ),
    );
  }
}
