import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';

class SuccessResetPassword
    extends StatelessWidget {
  const SuccessResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,

        title: Text(
          "Success Reset Password",

          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons
                    .check_circle_outline,
                size: 200,
                color: AppColor
                    .primarycolor,
              ),
            ),
            Text(
              "Successfully",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(
                    color:
                        AppColor.grey,
                  ),
            ),
            Text(
              "Your Account Has Been Created ",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                    color:
                        AppColor.grey,
                  ),
            ),
            Spacer(),

            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: " Go To Login ",
                onPressed: () {
                  // controller.goToLogin();
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
