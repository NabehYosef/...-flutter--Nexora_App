import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtomAuth
    extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  const CustomButtomAuth({
    super.key,
    this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 13,
        ),
        onPressed: onPressed,
        color: AppColor.primaryColor,

        textColor: Colors.white,
        child: Text(text!),
      ),
    );
  }
}
