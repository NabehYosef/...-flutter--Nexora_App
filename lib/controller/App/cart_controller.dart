import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/cart_data.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController
    extends GetxController {
  view();
  add(
    String productId,
    String color,
    int quantity,
  );
  removeItem(
    String productId,
    String color,
  );
  updateQuantity(
    String productId,
    String color,
    int quantity,
  );
  clearCart();
  placeOrder();
}

class CartControllerImp
    extends CartController {
  CartData cartData = CartData(
    Get.find(),
  );

  Statusrequest? statusRequest;

  List<CartModel> data = [];

  num totalPrice = 0;
  final num shippingCost = 300;

  final TextEditingController
  couponController =
      TextEditingController();
  String? appliedCoupon;
  bool isCreatingOrder = false;

  num get totalAfterCoupon {
    return totalPrice + shippingCost;
  }

  void applyCoupon() {
    final code = couponController.text
        .trim()
        .toUpperCase();

    if (code.isEmpty) {
      Get.snackbar(
        "Coupon",
        "Please enter a coupon code",
      );
      return;
    }

    appliedCoupon = code;
    Get.snackbar(
      "Coupon",
      "Coupon saved. It will be validated by server when placing the order.",
    );
    update();
  }

  @override
  placeOrder() async {
    if (isCreatingOrder) return;
    if (data.isEmpty) {
      Get.snackbar(
        "Order",
        "Cart is empty",
      );
      return;
    }

    Get.toNamed(AppRoute.checkout);
  }

  @override
  view() async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();

    var response = await cartData
        .viewCart(token: token);

    print(
      "=============================== Controller $response ",
    );

    statusRequest = handlingData(
      response,
    );

    if (Statusrequest.success ==
        statusRequest) {
      if (response['items'] != null) {
        List rawList =
            response['items'];
        data = rawList
            .map(
              (e) =>
                  CartModel.fromJson(e),
            )
            .toList();
        totalPrice =
            response['total'] ?? 0;
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }

    update();
  }

  @override
  add(
    String productId,
    String color,
    int quantity,
  ) async {
    String token =
        await TokenStorage.getToken();

    var response = await cartData
        .addToCart(
          productId,
          color,
          quantity,
          token: token,
        );

    print(
      "=============================== Controller $response ",
    );

    if (response is Map &&
        response['message'] != null) {
      Get.snackbar(
        "إشعار",
        "تم إضافة المنتج إلى السلة",
      );
      view();
    }
  }

  @override
  removeItem(
    String productId,
    String color,
  ) async {
    String token =
        await TokenStorage.getToken();

    var response = await cartData
        .removeItem(
          productId,
          color,
          token: token,
        );

    print(
      "=============================== Controller $response ",
    );

    if (response is Map &&
        response['message'] != null) {
      Get.snackbar(
        "إشعار",
        "تم حذف المنتج من السلة",
      );
      view();
    }
  }

  @override
  updateQuantity(
    String productId,
    String color,
    int quantity,
  ) async {
    var responseFuture = cartData
        .updateQuantity(
          productId,
          color,
          quantity,
          token:
              await TokenStorage.getToken(),
        );

    var response = await responseFuture;

    print(
      "=============================== Controller $response ",
    );

    if (response is Map &&
        response['message'] != null) {
      view();
    }
  }

  @override
  clearCart() async {
    String token =
        await TokenStorage.getToken();

    var response = await cartData
        .clearCart(token: token);

    print(
      "=============================== Controller $response ",
    );

    if (response is Map &&
        response['message'] != null) {
      Get.snackbar(
        "إشعار",
        "تم تفريغ السلة",
      );
      data.clear();
      totalPrice = 0;
      update();
    }
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
