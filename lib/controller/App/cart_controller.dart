import 'package:e_commerce/core/services/Apis/Apiserevices.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final ApiService _apiService = ApiService();

  var cartItems = [].obs;
  var totalPrice = 0.0.obs;
  var isLoading = false.obs;

  void addToCart(Map<String, dynamic> productData, int quantity) {
    cartItems.add({...productData, 'quantity': quantity});
    update();
  }

  void removeItem(dynamic itemId) {
    cartItems.removeWhere((item) => item['id'] == itemId);
  }
}