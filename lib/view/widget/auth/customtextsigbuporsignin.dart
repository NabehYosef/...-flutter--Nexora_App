import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignUpORSignIn
    extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSignUpORSignIn({
    super.key,
    required this.textone,
    required this.texttwo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Text(
          textone,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(
                color: AppColor.grey,
              ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(
                  color: AppColor
                      .primaryColor,
                  fontWeight:
                      FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
