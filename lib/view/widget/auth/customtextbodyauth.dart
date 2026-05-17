import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextBodyAuth
    extends StatelessWidget {
  final String? textbody;
  const CustomTextBodyAuth({
    super.key,
    this.textbody,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Text(
        textbody!,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(
              color: AppColor.grey,
            ),
      ),
    );
  }
}
