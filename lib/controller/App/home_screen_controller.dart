import 'package:e_commerce/controller/App/favorite_controller.dart';
import 'package:e_commerce/controller/App/myfavoritecontroller.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/screen/my_favorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController
    extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp
    extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Notifications"),
        ),
      ],
    ),
    const MyFavorite(),
    Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Center(child: Text("Profile")),
      ],
    ),
  ];

  List bottomappbar = [
    {
      "title": "home",
      "icon": Icons.home,
    },
    {
      "title": "notifications",
      "icon": Icons
          .notifications_active_outlined,
    },
    {
      "title": "Favorite",
      "icon": Icons.favorite,
    },
    {
      "title": "profile",
      "icon": Icons.person_pin_sharp,
    },
  ];

  @override
  changePage(int i) {
    currentpage = i;

    if (i == 2 &&
        Get.isRegistered<
          MyFavoriteControllerImp
        >()) {
      Get.find<
            MyFavoriteControllerImp
          >()
          .getData();
    }

    update();
  }

  @override
  void onInit() {
    if (Get.isRegistered<
      FavoriteControllerImp
    >()) {
      Get.find<FavoriteControllerImp>()
          .syncFavorites();
    }
    super.onInit();
  }
}
