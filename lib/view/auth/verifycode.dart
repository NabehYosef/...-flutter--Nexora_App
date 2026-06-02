import 'package:e_commerce/controller/auth/forgetpasswordcontroller.dart';
import 'package:e_commerce/controller/auth/verifycodecontroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:e_commerce/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:pinput/pinput.dart';

class VerifyCode
    extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller =
        Get.put(
          VerifyCodeControllerImp(),
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Verification Code",
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
              text: "Check Code",
            ),
            CustomTextBodyAuth(
              textbody:
                  "please Enter The Digit Code Sent To nabeh@gmail.com",
            ),
            SizedBox(height: 10),

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
                        .goToResetPassword();
                  },
            ),
          ],
        ),
      ),
    );
  }
}
