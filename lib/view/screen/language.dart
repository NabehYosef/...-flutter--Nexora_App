import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:e_commerce/view/widget/Language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language
    extends GetView<LocalController> {
  const Language({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(
          15,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Text("1".tr),
            const SizedBox(height: 20),
            CustomButtonLang(
              textbutton: "Ar",
              onPressed: () {
                controller
                    .changeLanguage(
                      "ar",
                    );
                Get.toNamed(
                  AppRoute.onBoarding,
                );
              },
            ),

            const SizedBox(height: 10),
            CustomButtonLang(
              textbutton: "En",
              onPressed: () {
                controller
                    .changeLanguage(
                      "en",
                    );
                Get.toNamed(
                  AppRoute.onBoarding,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
