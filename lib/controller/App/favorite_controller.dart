import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/favorite_data.dart';
import 'package:e_commerce/data/datasource/static/remote/myfavorite_data.dart';
import 'package:get/get.dart';

abstract class FavoriteController
    extends GetxController {
  addFavorite(String productId);
  removeFavorite(String productId);
  setFavorite(
    String productId,
    bool val,
  );
  syncFavorites();
}

class FavoriteControllerImp
    extends FavoriteController {
  FavoriteData favoriteData =
      FavoriteData(Get.find());
  MyFavoriteData myFavoriteData =
      MyFavoriteData(Get.find());

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

  // 👇 جلب قائمة المفضلة الحقيقية من السيرفر وتعبئة isFavorite
  @override
  syncFavorites() async {
    String token =
        await TokenStorage.getToken();

    var response = await myFavoriteData
        .getData(token: token);

    print(
      "=============================== Sync Favorites $response ",
    );

    if (response is Map &&
        response['data'] != null) {
      List rawList = response['data'];
      for (var item in rawList) {
        String? productId;
        if (item['productId'] != null) {
          if (item['productId']
              is Map) {
            productId =
                item['productId']['_id'];
          } else {
            productId =
                item['productId'];
          }
        }
        if (productId != null) {
          isFavorite[productId] = true;
        }
      }
      update();
    }
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

  @override
  void onInit() {
    syncFavorites();
    super.onInit();
  }
}
