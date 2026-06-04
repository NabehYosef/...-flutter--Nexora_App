import 'package:e_commerce/controller/auth/resetpassword_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Resetpassword
    extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp
    controller = Get.put(
      ResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'ResetPassword',
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
              text: "35".tr,
            ),
            const SizedBox(height: 10),
            CustomTextBodyAuth(
              textbody: "35".tr,
            ),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              controller:
                  controller.password,
              hintText: "13".tr,
              iconData:
                  Icons.lock_outline,
              labelText: "19".tr,
              // controller: ,
            ),
            CustomTextFormAuth(
              controller:
                  controller.repassword,
              hintText: "Re ${"13".tr}",
              iconData:
                  Icons.lock_outline,
              labelText: "19".tr,
              // controller: ,
            ),
            CustomButtomAuth(
              text: "33".tr,
              onPressed: () {
                controller
                    .goToSuccessResetPassword();
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
