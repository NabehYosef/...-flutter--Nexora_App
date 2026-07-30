import 'package:e_commerce/controller/App/favorite_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/static/remote/myfavorite_data.dart';
import 'package:e_commerce/model/myfavorite_model.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController
    extends GetxController {
  getData();
  deleteFromFavorite(String productId);
}

class MyFavoriteControllerImp
    extends MyFavoriteController {
  MyFavoriteData favoriteData =
      MyFavoriteData(Get.find());

  List<FavoriteModel> data = [];

  late Statusrequest statusRequest;

  MyServices myServices = Get.find();

  @override
  getData() async {
    data.clear();
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();

    var response = await favoriteData
        .getData(token: token);

    print(
      "=============================== Controller $response ",
    );

    statusRequest = handlingData(
      response,
    );

    if (Statusrequest.success ==
        statusRequest) {
      if (response['data'] != null) {
        List rawList = response['data'];
        data = rawList
            .map(
              (e) =>
                  FavoriteModel.fromJson(
                    e,
                  ),
            )
            .toList();

        if (Get.isRegistered<
          FavoriteControllerImp
        >()) {
          FavoriteControllerImp
          favController =
              Get.find<
                FavoriteControllerImp
              >();
          for (var item in data) {
            if (item.productId !=
                null) {
              favController.setFavorite(
                item.productId!,
                true,
              );
            }
          }
        }
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }

    update();
  }

  @override
  deleteFromFavorite(
    String productId,
  ) async {
    String token =
        await TokenStorage.getToken();

    var response = await favoriteData
        .deleteData(
          productId,
          token: token,
        );

    print(
      "=============================== Delete $response ",
    );

    if (response is Map &&
        response['message'] != null) {
      data.removeWhere(
        (element) =>
            element.productId ==
            productId,
      );
      Get.snackbar(
        "إشعار",
        "تم حذف المنتج من المفضلة",
      );
      if (Get.isRegistered<
        FavoriteControllerImp
      >()) {
        FavoriteControllerImp
        favController =
            Get.find<
              FavoriteControllerImp
            >();
        favController.setFavorite(
          productId,
          false,
        );
      }

      update();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
