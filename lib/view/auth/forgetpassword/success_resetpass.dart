import 'package:e_commerce/controller/auth/forgetpass/resetpassword_controller.dart';
import 'package:e_commerce/controller/auth/forgetpass/verfiycode_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword
    extends StatelessWidget {
  const SuccessResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => VerifyCodeControllerImp(),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Success',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(
        builder: (controller) {
          return Container(
            padding:
                const EdgeInsets.all(
                  15,
                ),
            child: Column(
              children: [
                const Center(
                  child: Icon(
                    Icons
                        .check_circle_outline,
                    size: 200,
                    color: AppColor
                        .primarycolor,
                  ),
                ),
                Text(
                  "37".tr,
                  style:
                      Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                            fontSize:
                                30,
                          ),
                ),
                Text("36".tr),
                const Spacer(),
                SizedBox(
                  width:
                      double.infinity,
                  child: CustomButtomAuth(
                    text: "31".tr,
                    // onPressed: () {
                    //   controller
                    //    //   .goToSignUpSuccess();
                    // },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
