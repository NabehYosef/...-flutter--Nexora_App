import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:get/get.dart';

abstract class ItemsController
    extends GetxController {
  intialData();
  changeCat(int val);
  getProducts();
}

class ItemsControllerImp
    extends ItemsController {
  List<CategoryModel> categories = [];
  int? selectedCat;

  List<ProductModel> products = [];
  Statusrequest? statusRequest;

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    final rawCategories =
        Get.arguments['categories'];

    categories = (rawCategories as List)
        .map((item) {
          if (item is CategoryModel) {
            return item;
          } else {
            return CategoryModel.fromJson(
              item
                  as Map<
                    String,
                    dynamic
                  >,
            );
          }
        })
        .toList();

    selectedCat =
        Get.arguments['selectedcat'];

    getProducts();
  }

  @override
  changeCat(val) {
    selectedCat = val;
    getProducts();
  }

  @override
  getProducts() async {
    statusRequest =
        Statusrequest.loading;
    update();

    final categoryName =
        categories[selectedCat!]
            .categoryName;

    var response = await Crud().getData(
      AppLink.filterProducts,
      queryParams: {
        "category": categoryName ?? "",
        "page": "1",
        "limit": "20",
      },
    );

    response.fold(
      (failure) {
        statusRequest = failure;
        products = [];
        update();
      },
      (data) {
        List rawList =
            data['data'] ?? [];
        products = rawList
            .map(
              (item) =>
                  ProductModel.fromJson(
                    item,
                  ),
            )
            .toList();

        statusRequest = products.isEmpty
            ? Statusrequest.failure
            : Statusrequest.success;
        update();
      },
    );
  }
}
