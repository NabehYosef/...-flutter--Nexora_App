import 'package:get/get.dart';

class CartController
    extends GetxController {
  var cartItems = [].obs;
  var totalPrice = 0.0.obs;
  var isLoading = false.obs;

  void addToCart(
    Map<String, dynamic> productData,
    int quantity,
  ) {
    cartItems.add({
      ...productData,
      'quantity': quantity,
    });
    update();
  }

  void removeItem(dynamic itemId) {
    cartItems.removeWhere(
      (item) => item['id'] == itemId,
    );
  }
}
