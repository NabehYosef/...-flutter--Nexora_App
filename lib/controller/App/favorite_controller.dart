import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/favorite_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FavoriteController
    extends GetxController {
  FavoriteData favoriteData =
      FavoriteData(Get.find());

  // مفتاح: productId — قيمة: true/false (هل هو مفضل أو لأ)
  Map<String, bool> isFavorite = {};

  Statusrequest? statusRequest;

  setFavorite(
    String productId,
    bool val,
  ) {
    isFavorite[productId] = val;
    update();
  }

  addFavorite(String productId) async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();

    var response = await favoriteData
        .addFavorite(
          productId,
          token: token,
        );

    print(
      "=============================== Controller $response ",
    );

    statusRequest = handlingData(
      response,
    );

    if (Statusrequest.success ==
        statusRequest) {
      if (response is Map &&
          response['message'] != null) {
        setFavorite(productId, true);
        Get.rawSnackbar(
          title: "إشعار",
          messageText: const Text(
            "تم إضافة المنتج للمفضلة",
          ),
        );
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }

    update();
  }

  removeFavorite(
    String productId,
  ) async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();

    var response = await favoriteData
        .removeFavorite(
          productId,
          token: token,
        );

    print(
      "=============================== Controller $response ",
    );

    statusRequest = handlingData(
      response,
    );

    if (Statusrequest.success ==
        statusRequest) {
      if (response is Map &&
          response['message'] != null) {
        setFavorite(productId, false);
        Get.rawSnackbar(
          title: "إشعار",
          messageText: const Text(
            "تم حذف المنتج من المفضلة",
          ),
        );
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }

    update();
  }
}
