import 'package:e_commerce/controller/auth/logincontroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:e_commerce/view/widget/auth/customlogoauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtextsigbuporsignin.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller =
        Get.put(LoginControllerImp());

    return Scaffold(
      backgroundColor:
          AppColor.backgroundcolor,

      appBar: AppBar(
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,

        title: Text(
          "Sign In",

          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(
                color: AppColor.grey,
              ),
        ),
      ),

      body: SafeArea(
        child: Form(
          //  key: controller.formstate,
          child: Container(
            padding:
                const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),

            child: ListView(
              children: [
                /// Logo
                Container(
                  margin:
                      const EdgeInsets.only(
                        top: 10,
                        bottom: 20,
                      ),

                  height: 140,
                  width: 140,

                  child:
                      const LogoAuth(),
                ),

                /// Title
                const CustomTextTitleAuth(
                  text: "Welcome Back",
                ),

                const SizedBox(
                  height: 10,
                ),

                /// Body
                const CustomTextBodyAuth(
                  textbody:
                      "Sign in with your email and password or continue with social media",
                ),

                const SizedBox(
                  height: 30,
                ),

                /// Email
                CustomTextFormAuth(
                  controller:
                      controller.email,

                  hintText:
                      "Enter Your Email",

                  labelText: "Email",

                  iconData: Icons
                      .email_outlined,
                ),

                /// Password
                CustomTextFormAuth(
                  controller: controller
                      .password,

                  hintText:
                      "Enter Your Password",

                  labelText: "Password",

                  iconData: Icons
                      .lock_outline,

                  obscureText: true,
                ),

                /// Forget Password
                Align(
                  alignment: Alignment
                      .centerRight,

                  child: InkWell(
                    onTap: () {
                      controller.GoToForgetPassword();
                    },
                    child: Text(
                      "Forget Password?",

                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                            color:
                                AppColor
                                    .grey,
                          ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                /// Button
                CustomButtomAuth(
                  text: "Sign In",

                  onPressed: () {
                    controller.login();
                  },
                ),

                const SizedBox(
                  height: 20,
                ),

                /// Sign Up
                CustomTextSignUpORSignIn(
                  textone:
                      "Don't Have An Account?",

                  texttwo: "Sign Up",

                  onTap: controller
                      .GoToSignUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
