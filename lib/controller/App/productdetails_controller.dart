import 'package:e_commerce/controller/App/home_controller.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController
    extends GetxController {}

class ProductDetailsControllerImp
    extends ProductDetailsController {
  late ProductModel productModel;

  int count = 1;

  List<Map<String, dynamic>> subitems =
      [];

  initialData() {
    if (Get.arguments['productModel'] !=
        null) {
      productModel =
          Get.arguments['productModel'];
    } else if (Get
            .arguments['productId'] !=
        null) {
      String productId =
          Get.arguments['productId'];
      HomeControllerImp homeController =
          Get.isRegistered<
            HomeControllerImp
          >()
          ? Get.find<
              HomeControllerImp
            >()
          : Get.put(
              HomeControllerImp(),
            );

      try {
        productModel = homeController
            .products
            .firstWhere(
              (p) => p.id == productId,
            );
      } catch (e) {
        productModel = ProductModel();
      }
    }

    if (productModel.colors != null &&
        productModel
            .colors!
            .isNotEmpty) {
      subitems = List.generate(
        productModel.colors!.length,
        (index) => {
          "name": productModel
              .colors![index],
          "active": index == 0
              ? "1"
              : "0",
        },
      );
    }
  }

  selectColor(int selectedIndex) {
    for (
      int i = 0;
      i < subitems.length;
      i++
    ) {
      subitems[i]['active'] =
          (i == selectedIndex)
          ? "1"
          : "0";
    }
    update();
  }

  increaseCount() {
    if (count <
        (productModel.stock ?? 1)) {
      count++;
      update();
    }
  }

  decreaseCount() {
    if (count > 1) {
      count--;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
