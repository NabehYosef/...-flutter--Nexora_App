import 'package:e_commerce/controller/App/profile_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyPhoneChange extends StatelessWidget {
  const VerifyPhoneChange({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify new phone number'),
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We sent a verification code to',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              controller.pendingPhoneNumber ?? '',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: InputDecoration(
                labelText: 'Enter 4-digit code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                color: AppColor.primaryColor,
                textColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                onPressed: () {
                  controller.verifyPhoneChange(otpController.text);
                },
                child: const Text('Verify code'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  controller.resendPhoneOtp();
                },
                child: const Text('Resend code'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
