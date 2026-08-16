import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/static/remote/home_data.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SearchMixController
    extends GetxController {
  TextEditingController?
  searchController;
  bool isSearch = false;
  List<ProductModel> searchResults = [];
  late Statusrequest
  searchStatusRequest;

  HomeData homedata = HomeData(
    Get.find(),
  );

  searchData() async {
    searchStatusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();

    var response = await homedata
        .searchProducts(
          searchController!.text.trim(),
          token: token,
        );

    searchStatusRequest = handlingData(
      response,
    );

    if (Statusrequest.success ==
        searchStatusRequest) {
      if (response['data'] != null) {
        List rawList = response['data'];
        searchResults = rawList
            .map(
              (item) =>
                  ProductModel.fromJson(
                    item,
                  ),
            )
            .toList();
      } else {
        searchStatusRequest =
            Statusrequest.failure;
      }
    }
    update();
  }

  checkSearch(String val) {
    if (val.isEmpty) {
      isSearch = false;
      searchResults.clear();
    }
    update();
  }

  onSearchItems() {
    if (searchController!.text
        .trim()
        .isEmpty)
      return;
    isSearch = true;
    searchData();
  }
}

abstract class HomeController
    extends SearchMixController {
  initialData();
  getdata();
  goToItems(String categoryName);
}

class HomeControllerImp
    extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;

  HomeData homedata = HomeData(
    Get.find(),
  );

  List<CategoryModel> categories = [];
  List<ProductModel> products = [];

  late Statusrequest statusRequest;

  @override
  initialData() {
    username = myServices
        .sharedPreferences
        .getString("username");
    id = myServices.sharedPreferences
        .getString("id");
  }

  @override
  void onInit() {
    searchController =
        TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();

    var productsResponse =
        await homedata.getData(
          token: token,
        );
    var categoriesResponse =
        await homedata.getCategories(
          token: token,
        );

    statusRequest = handlingData(
      productsResponse,
    );

    if (Statusrequest.success ==
        statusRequest) {
      if (productsResponse['data'] !=
          null) {
        List rawList =
            productsResponse['data'];
        products = rawList
            .map(
              (item) =>
                  ProductModel.fromJson(
                    item,
                  ),
            )
            .toList();
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }

    if (categoriesResponse is Map &&
        categoriesResponse['categories'] !=
            null) {
      List rawCategories =
          categoriesResponse['categories'];
      categories = rawCategories
          .map(
            (e) =>
                CategoryModel.fromJson(
                  e,
                ),
          )
          .toList();
    }

    update();
  }

  @override
  goToItems(String categoryName) {
    int selectedIndex = categories
        .indexWhere(
          (cat) =>
              cat.categoryName ==
              categoryName,
        );

    Get.toNamed(
      AppRoute.Items,
      arguments: {
        "categories": categories,
        "selectedcat":
            selectedIndex >= 0
            ? selectedIndex
            : 0,
      },
    );
  }

  @override
  void onClose() {
    searchController?.dispose();
    super.onClose();
  }
}
