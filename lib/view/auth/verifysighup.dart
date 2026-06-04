import 'package:e_commerce/controller/auth/verifycode_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeSignup
    extends StatelessWidget {
  const VerifyCodeSignup({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller =
        Get.put(
          VerifyCodeControllerImp(),
        );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Verification Code',
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
            const CustomTextTitleAuth(
              text: "Check code",
            ),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
              textbody:
                  "Please Enter The Digit Code Sent To nabeh@gmail.com",
            ),
            const SizedBox(height: 15),
            Pinput(
              length: 5,

              defaultPinTheme: PinTheme(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                ),
              ),

              focusedPinTheme: PinTheme(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors
                        .deepPurple,
                    width: 2,
                  ),
                  borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                ),
              ),
              onChanged: (value) {
                print(
                  "Changed: $value",
                );
              },

              onCompleted:
                  (
                    String
                    verificationcode,
                  ) {
                    controller
                        .goToSignUpSuccess();
                  },
            ),
          ],
        ),
      ),
    );
  }
}
