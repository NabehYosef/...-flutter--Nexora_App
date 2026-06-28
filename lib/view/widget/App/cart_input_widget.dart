import 'package:flutter/material.dart';

class CouponInputWidget
    extends StatelessWidget {
  final TextEditingController
  controller;
  final VoidCallback onApply;

  const CouponInputWidget({
    super.key,
    required this.controller,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          "أدخل كود الخصم",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration:
                    const InputDecoration(
                      hintText:
                          'أدخل الكود',
                      border:
                          OutlineInputBorder(),
                    ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: onApply,
              child: const Text(
                "تطبيق",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
