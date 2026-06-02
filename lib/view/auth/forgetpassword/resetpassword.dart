import 'package:e_commerce/controller/auth/forgetpasswordcontroller.dart';
import 'package:e_commerce/controller/auth/resetpasswordcontroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

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
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Reset Password",
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
              text: "New Password",
            ),
            CustomTextBodyAuth(
              textbody:
                  "Please Enter Your New Password",
            ),
            SizedBox(height: 10),
            CustomTextFormAuth(
              controller:
                  controller.password,
              hintText:
                  "Enter Your Password",
              labelText: "Password",
              iconData:
                  Icons.lock_outline,
              //mycontroller;
            ),
            CustomTextFormAuth(
              controller:
                  controller.password,
              hintText:
                  "Re Enter Your Password",
              labelText: "Password",
              iconData:
                  Icons.lock_outline,
              //mycontroller;
            ),
            CustomButtomAuth(
              text: " Save ",
              onPressed: () {
                controller
                    .goToSuccessResetPassword();
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
