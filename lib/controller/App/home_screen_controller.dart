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
        Center(child: Text("Settings")),
      ],
    ),
    Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Center(child: Text("Profile")),
      ],
    ),
    const MyFavorite(),
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
      "title": "profile",
      "icon": Icons.person_pin_sharp,
    },
    {
      "title": "Favorite",
      "icon": Icons.favorite,
    },
  ];

  @override
  changePage(int i) {
    currentpage = i;

    // لما ينتقل اليوزر لتاب Favorite (index 3)، حدّث البيانات من السيرفر
    if (i == 3 &&
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
}
