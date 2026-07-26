import 'package:e_commerce/controller/App/home_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/view/widget/customappbar.dart';
import 'package:e_commerce/view/widget/home/customcardhome.dart';
import 'package:e_commerce/view/widget/home/customtitlehome.dart';
import 'package:e_commerce/view/widget/home/lisstcatygorieshome.dart';
import 'package:e_commerce/view/widget/home/listitemshow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller
                .statusRequest,
            widget: Container(
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
              child: ListView(
                children: [
                  CustomAppBar(
                    titleappbar:
                        "Find Product",
                    onPressedIcon:
                        () {},
                    onPressedSearch:
                        () {},
                  ),
                  const CustomCardHome(
                    title:
                        "A summer surprise",
                    body:
                        "Cashback 20%",
                  ),
                  const CustomTitleHome(
                    title: "Categories",
                  ),
                  const ListCategoriesHome(),
                  const CustomTitleHome(
                    title:
                        "Product for you",
                  ),
                  const ListItemsHome(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
