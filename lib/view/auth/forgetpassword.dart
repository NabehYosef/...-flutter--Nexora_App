import 'package:e_commerce/controller/auth/forgetpasswordcontroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class Forgetpassword
    extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp
    controller = Get.put(
      ForgetPasswordControllerImp(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Forget Password",
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
              text: "Check Your Email",
            ),
            CustomTextBodyAuth(
              textbody:
                  "please Enter Your Email Address To Recive A verification code",
            ),
            SizedBox(height: 10),

            CustomTextFormAuth(
              controller:
                  controller.email,
              hintText:
                  "Enter Your Email",
              labelText: "Email",
              iconData:
                  Icons.email_outlined,
            ),

            CustomButtomAuth(
              text: " Check ",
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
