import 'package:e_commerce/controller/auth/signup/signup_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/alertexitapp.dart';
import 'package:e_commerce/core/functions/validinput.dart';
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

      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) =>
              controller
                      .statusRequest ==
                  Statusrequest.loading
              ? Center(
                  child: Text(
                    "Loading",
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
                              "24".tr,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        CustomTextFormAuth(
                          isNumber:
                              false,
                          valid: (val) {
                            return validInput(
                              val!,
                              3,
                              20,
                              "username",
                            );
                          },
                          controller:
                              controller
                                  .usernName,
                          hintText:
                              "23".tr,
                          iconData: Icons
                              .person_outline,
                          labelText:
                              "20".tr,
                        ),

                        CustomTextFormAuth(
                          isNumber:
                              false,
                          valid: (val) {
                            return validInput(
                              val!,
                              3,
                              40,
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
                        ),

                        CustomTextFormAuth(
                          isNumber:
                              true,
                          valid: (val) {
                            return validInput(
                              val!,
                              7,
                              11,
                              "phone",
                            );
                          },
                          controller:
                              controller
                                  .phone,
                          hintText:
                              "22".tr,
                          iconData: Icons
                              .phone_android_outlined,
                          labelText:
                              "21".tr,
                        ),

                        GetBuilder<
                          SignUpControllerImp
                        >(
                          builder: (controller) {
                            return CustomTextFormAuth(
                              // onTapIcon: () {
                              //   controller
                              //       .showPassword();
                              // },
                              obscureText:
                                  controller
                                      .isShowPassword,
                              onTapIcon: () {
                                controller
                                    .showPassword();
                              },
                              isNumber:
                                  false,
                              valid: (val) {
                                return validInput(
                                  val!,
                                  3,
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
                            );
                          },
                        ),
                        CustomTextFormAuth(
                          isNumber:
                              true,
                          valid: (val) {
                            return validInput(
                              val!,
                              7,
                              11,
                              "Your BirthDate",
                            );
                          },
                          controller:
                              controller
                                  .birthDate,
                          hintText:
                              "43".tr,
                          iconData: Icons
                              .celebration_outlined,
                          labelText:
                              "43".tr,
                        ),

                        CustomButtomAuth(
                          text: "17".tr,
                          onPressed: () {
                            controller
                                .signUp();
                          },
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        CustomTextSignUpORSignIn(
                          textone:
                              "25".tr,
                          texttwo:
                              "26".tr,
                          onTap: () {
                            controller
                                .goToSignIn();
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
