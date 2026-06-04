import 'package:e_commerce/controller/auth/checkemail_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmail
    extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller =
        Get.put(
          CheckEmailControllerImp(),
        );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          '27'.tr,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      body: Container(
        padding:
            const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(
              text: "28".tr,
            ),
            const SizedBox(height: 10),
            CustomTextBodyAuth(
              textbody: "29".tr,
            ),

            const SizedBox(height: 15),
            CustomTextFormAuth(
              controller:
                  controller.email,
              hintText: "12".tr,
              iconData:
                  Icons.email_outlined,
              labelText: "18".tr,
              // mycontroller: ,
            ),
            CustomButtomAuth(
              text: "30".tr,
              onPressed: () {
                controller
                    .goToVerfiyCode();
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
