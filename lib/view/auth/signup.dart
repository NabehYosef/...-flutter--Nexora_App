import 'package:e_commerce/controller/auth/signup_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtextsigbuporsignin.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller =
        Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          '17'.tr,
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
              text: "10".tr,
            ),
            const SizedBox(height: 10),
            CustomTextBodyAuth(
              textbody: "24".tr,
            ),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              controller:
                  controller.username,
              hintText: "23".tr,
              iconData:
                  Icons.person_outline,
              labelText: "20".tr,
              // mycontroller: ,
            ),
            CustomTextFormAuth(
              controller:
                  controller.email,
              hintText: "12".tr,
              iconData:
                  Icons.email_outlined,
              labelText: "18".tr,
              // mycontroller: ,
            ),
            CustomTextFormAuth(
              controller:
                  controller.phone,
              hintText: "22".tr,
              iconData: Icons
                  .phone_android_outlined,
              labelText: "21".tr,
              // mycontroller: ,
            ),
            CustomTextFormAuth(
              controller:
                  controller.password,
              hintText: "13".tr,
              iconData:
                  Icons.lock_outline,
              labelText: "19".tr,
              // mycontroller: ,
            ),
            CustomButtomAuth(
              text: "17".tr,
              onPressed: () {
                controller.signup();
              },
            ),
            const SizedBox(height: 40),
            CustomTextSignUpORSignIn(
              textone: "25".tr,
              texttwo: "26".tr,
              onTap: () {
                controller.goToSignIn();
              },
            ),
          ],
        ),
      ),
    );
  }
}
