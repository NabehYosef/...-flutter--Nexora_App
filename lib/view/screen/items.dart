import 'package:e_commerce/controller/App/itemes_controller.dart';
import 'package:e_commerce/view/widget/Item/listcategoryitems.dart';
import 'package:e_commerce/view/widget/customappbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller =
        Get.put(ItemsControllerImp());

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              titleappbar:
                  "Find Product",
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
            SizedBox(height: 20),
            const ListCategoriesItems(),
          ],
        ),
      ),
    );
  }
}
