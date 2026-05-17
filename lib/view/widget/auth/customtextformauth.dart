import 'package:flutter/material.dart';

class CustomTextFormAuth
    extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? iconData;
  final TextEditingController
  controller;
  final bool obscureText;

  const CustomTextFormAuth({
    super.key,
    this.hintText,
    this.labelText,
    this.iconData,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),

      child: TextFormField(
        controller: controller,
        obscureText: obscureText,

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

          suffixIcon: Icon(iconData),

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
