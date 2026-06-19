import 'package:e_commerce/controller/auth/login_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/alertexitapp.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:e_commerce/view/widget/auth/customlogoauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtextsigbuporsignin.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          '-1'.tr,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) =>
              controller
                      .statusrequest ==
                  Statusrequest.loading
              ? Center(
                  child: Text(
                    "Loading...",
                  ),
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                  child: Form(
                    key: controller
                        .formstate,
                    child: ListView(
                      children: [
                        LogoAuth(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextTitleAuth(
                          text: "10".tr,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBodyAuth(
                          textbody:
                              "11".tr,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormAuth(
                          isNumber:
                              false,
                          valid: (value) {
                            return validInput(
                              value!,
                              5,
                              100,
                              "email",
                            );
                          },
                          controller:
                              controller
                                  .email,
                          hintText:
                              "12".tr,
                          iconData: Icons
                              .email_outlined,
                          labelText:
                              "18".tr,
                          // mycontroller: ,
                        ),
                        GetBuilder<
                          LoginControllerImp
                        >(
                          builder: (controller) {
                            return CustomTextFormAuth(
                              onTapIcon: () {
                                controller
                                    .showPassword();
                              },
                              obscureText:
                                  controller
                                      .isShowPassword,
                              isNumber:
                                  false,
                              valid: (value) {
                                return validInput(
                                  value!,
                                  5,
                                  30,
                                  "password",
                                );
                              },

                              controller:
                                  controller
                                      .password,
                              hintText:
                                  "13".tr,
                              iconData:
                                  Icons
                                      .lock_outline,
                              labelText:
                                  "19".tr,
                              // mycontroller: ,
                            );
                          },
                        ),
                        InkWell(
                          onTap: () {
                            controller.GoToForgetPassword();
                          },
                          child: Text(
                            "14".tr,
                            textAlign:
                                TextAlign
                                    .right,
                          ),
                        ),
                        CustomButtomAuth(
                          text: "15".tr,
                          onPressed: () {
                            controller
                                .login();
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomTextSignUpORSignIn(
                          textone:
                              "16".tr,
                          texttwo:
                              "17".tr,
                          onTap: () {
                            controller.GoToSignUp();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
