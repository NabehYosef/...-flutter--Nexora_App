import 'package:e_commerce/controller/App/favorite_controller.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/screen/profile.dart';
import 'package:e_commerce/view/screen/setting.dart';
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
    // TODO: استبدلها بصفحة Profile الفعلية
    const Profile(),
    const Settings(),
  ];

  List<Map<String, dynamic>>
  bottomappbar = [
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
      "title": "profile",
      "icon": Icons.person_pin_sharp,
    },
    {
      "title": "settings",
      "icon": Icons.settings_outlined,
    },
  ];

  @override
  changePage(int i) {
    currentpage = i;
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
