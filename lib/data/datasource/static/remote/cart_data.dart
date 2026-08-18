import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  viewCart({String? token}) async {
    var response = await crud.getData(
      AppLink.showUserCart,
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  addToCart(
    String productId,
    String color,
    int quantity, {
    String? token,
  }) async {
    var response = await crud
        .postData(AppLink.addToCart, {
          "productId": productId,
          "color": color,
          "quantity": quantity,
        }, token: token);
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  removeItem(
    String productId,
    String color, {
    String? token,
  }) async {
    var response = await crud
        .deleteData(
          AppLink.removeCartItem,
          body: {
            "productId": productId,
            "color": color,
          },
          token: token,
        );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  updateQuantity(
    String productId,
    String color,
    int quantity, {
    String? token,
  }) async {
    var response = await crud.patchData(
      AppLink.updateCartQuantity,
      {
        "productId": productId,
        "color": color,
        "quantity": quantity,
      },
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  clearCart({String? token}) async {
    var response = await crud
        .deleteData(
          AppLink.clearCart,
          token: token,
        );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  totalItems({String? token}) async {
    var response = await crud.getData(
      AppLink.cartTotalItems,
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  createOrder(
    String shippingAddressId, {
    String? notes,
    String? discountCode,
    String? token,
  }) async {
    final Map<String, dynamic> body = {
      "shippingAddressId":
          shippingAddressId,
    };

    if (notes != null &&
        notes.trim().isNotEmpty) {
      body["notes"] = notes.trim();
    }

    if (discountCode != null &&
        discountCode
            .trim()
            .isNotEmpty) {
      body["discountCode"] =
          discountCode.trim();
    }

    var response = await crud.postData(
      AppLink.createOrder,
      body,
      token: token,
    );

    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
