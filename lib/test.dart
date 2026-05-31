import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            //   OTPTextField(
            //   numberOfFields: 4,
            //   borderColor: Color(0xFF512DA8),
            //   focusedBorderColor: Color(0xFF512DA8),
            //   showFieldAsBox: true,
            // ),
          ],
        ),
      ),
    );
  }
}
