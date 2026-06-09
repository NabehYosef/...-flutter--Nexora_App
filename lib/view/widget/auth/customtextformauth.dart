import 'package:flutter/material.dart';

class CustomTextFormAuth
    extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? iconData;
  final TextEditingController
  controller;
  final String? Function(String?)?
  valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextFormAuth({
    this.obscureText = false,
    this.onTapIcon,
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.controller,
    required this.valid,
    required this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        obscureText: obscureText!,
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(
                decimal: true,
              )
            : TextInputType.text,
        validator: valid,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior:
              FloatingLabelBehavior
                  .always,

          contentPadding:
              const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 30,
              ),

          label: Container(
            margin:
                const EdgeInsets.symmetric(
                  horizontal: 9,
                ),
            child: Text(labelText!),
          ),

          hintText: hintText,

          hintStyle: const TextStyle(
            fontSize: 14,
          ),

          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              iconData,
              size: 20,
            ),
          ),

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(
                  30,
                ),
          ),
        ),
      ),
    );
  }
}
