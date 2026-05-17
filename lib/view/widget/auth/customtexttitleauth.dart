import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextTitleAuth
    extends StatelessWidget {
  final String? text;
  const CustomTextTitleAuth({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(
            color: AppColor.black,
          ),
    );
  }
}
