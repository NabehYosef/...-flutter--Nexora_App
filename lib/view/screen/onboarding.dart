import 'package:e_commerce/view/widget/onboarding/custombutton.dart';
import 'package:e_commerce/view/widget/onboarding/dotcontroller.dart';
import 'package:e_commerce/view/widget/onboarding/slider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/data/datasource/static/static.dart';

class OnBoarding
    extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child:
                  CustomSliderOnBodarding(),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  CustomDotController(),
                  Spacer(flex: 2),
                  Custombutton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
