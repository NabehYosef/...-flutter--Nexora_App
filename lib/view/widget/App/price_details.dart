import 'package:e_commerce/controller/App/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceDetailsWidget
    extends StatelessWidget {
  const PriceDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cart =
        Get.find();

    return Obx(
      () => Container(
        child: Column(
          children: [
            Text(
              "Total: ${cart.totalPrice.value}\$",
            ),
          ],
        ),
      ),
    );
  }
}
