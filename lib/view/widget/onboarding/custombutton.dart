import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class Custombutton
    extends StatelessWidget {
  const Custombutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 30,
      ),
      height: 40,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 0,
        ),
        onPressed: () {},
        textColor: Colors.white,
        color: AppColor.primarycolor,
        child: Text("Continu"),
      ),
    );
  }
}
