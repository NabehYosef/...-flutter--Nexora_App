import 'package:e_commerce/controller/App/home_screen_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen
    extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<
      HomeScreenControllerImp
    >(
      builder: (controller) => Scaffold(
        floatingActionButton:
            FloatingActionButton(
              backgroundColor:
                  AppColor.primaryColor,
              onPressed: () {},
              child: const Icon(
                Icons
                    .shopping_basket_outlined,
              ),
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation
                .centerDocked,
        bottomNavigationBar:
            const CustomBottomAppBarHome(),
        body: controller.listPage
            .elementAt(
              controller.currentpage,
            ),
      ),
    );
  }
}
