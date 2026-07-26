import 'package:e_commerce/model/productmodel.dart';
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
    productModel =
        Get.arguments['productModel'];
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
