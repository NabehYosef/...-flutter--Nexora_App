import 'package:e_commerce/controller/auth/forgetpassword_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Forgetpassword
    extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () =>
          ForgetPasswordControllerImp(),
    );
    ForgetPasswordControllerImp
    controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '14'.tr,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        child: ListView(
          children: [
            SizedBox(height: 10),
            CustomTextTitleAuth(
              text: "27".tr,
            ),
            CustomTextBodyAuth(
              textbody: "29".tr,
            ),
            SizedBox(height: 10),

            CustomTextFormAuth(
              isNumber: false,
              valid: (value) {
                return validInput(
                  value!,
                  5,
                  100,
                  "email",
                );
              },
              controller:
                  controller.email,
              hintText: "12".tr,
              labelText: "18".tr,
              iconData:
                  Icons.email_outlined,
            ),

            CustomButtomAuth(
              text: "30".tr,
              onPressed: () {
                controller
                    .goToVerifyCode();
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
