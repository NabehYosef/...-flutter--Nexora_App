import 'package:e_commerce/controller/auth/signupcontroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller =
        Get.put(SignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Sign Up",
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
              text: "Create Account",
            ),
            CustomTextBodyAuth(
              textbody:
                  "Create your account using email and password",
            ),
            SizedBox(height: 10),
            CustomTextFormAuth(
              controller:
                  controller.username,
              hintText:
                  "Enter Your User Name",
              labelText: "User Name",
              iconData:
                  Icons.person_outline,
            ),
            CustomTextFormAuth(
              controller:
                  controller.email,
              hintText:
                  "Enter Your Email",
              labelText: "Email",
              iconData:
                  Icons.email_outlined,
            ),
            CustomTextFormAuth(
              controller:
                  controller.phone,
              hintText:
                  "Enter Your phone",
              labelText: "Phone",
              iconData:
                  Icons.phone_outlined,
            ),
            //   SizedBox(height: 20),
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

            CustomButtomAuth(
              text: " Sign Up ",
              onPressed: () {},
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .center,
              children: [
                Text(
                  "Do you have an account? ",
                  style:
                      Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            color:
                                AppColor
                                    .grey,
                          ),
                ),

                InkWell(
                  onTap: () {
                    controller
                        .goToSignIn();
                  },
                  child: Text(
                    "Sign In",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                          color: AppColor
                              .primarycolor,
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
