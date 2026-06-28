import 'package:e_commerce/view/screen/App/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController
    extends GetxController {
  RxInt quantity = 1.obs;
  RxString selectedColor = "red".obs;
  RxBool isAddingToCart = false.obs;

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1)
      quantity.value--;
  }

  void selectColor(String color) {
    selectedColor.value = color;
  }

  Future<void> addToCartBackend(
    String token,
    String productId,
  ) async {
    isAddingToCart.value = true;

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    try {
      Get.snackbar(
        "تمت الإضافة بنجاح",
        "الكمية: ${quantity.value} - اللون: ${selectedColor.value}",
        snackPosition:
            SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        duration: const Duration(
          seconds: 2,
        ),
      );

      Get.to(() => CartScreen());
    } catch (e) {
      Get.snackbar(
        "خطأ",
        "فشل الاتصال",
      );
    } finally {
      isAddingToCart.value = false;
    }
  }
}
