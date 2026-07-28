import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/favorite_data.dart';
import 'package:get/get.dart';

abstract class FavoriteController
    extends GetxController {
  addFavorite(String productId);
  removeFavorite(String productId);
  setFavorite(
    String productId,
    bool val,
  );
}

class FavoriteControllerImp
    extends FavoriteController {
  FavoriteData favoriteData =
      FavoriteData(Get.find());

  Map<String, bool> isFavorite = {};

  Statusrequest? statusRequest;

  @override
  setFavorite(
    String productId,
    bool val,
  ) {
    isFavorite[productId] = val;
    update();
  }

  @override
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
        Get.snackbar(
          "إشعار",
          "تم إضافة المنتج للمفضلة",
        );
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }

    update();
  }

  @override
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

    if (response is Map &&
        response['message'] ==
            "Product removed from favourite") {
      statusRequest =
          Statusrequest.success;
      setFavorite(productId, false);
      Get.snackbar(
        "إشعار",
        "تم حذف المنتج من المفضلة",
      );
    } else {
      statusRequest =
          Statusrequest.serverfailure;
    }

    update();
  }
}
