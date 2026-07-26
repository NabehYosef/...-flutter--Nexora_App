import 'package:e_commerce/controller/App/myfavoritecontroller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite
    extends StatelessWidget {
  const MyFavorite({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Favorite",
        ),
      ),
      body: Container(
        padding:
            const EdgeInsets.symmetric(
              horizontal: 10,
            ),
        child: GetBuilder<MyFavoriteControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller
                .statusRequest,
            widget:
                controller.data.isEmpty
                ? const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.only(
                            top: 100,
                          ),
                      child: Text(
                        "لا توجد منتجات في المفضلة",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors
                              .grey,
                        ),
                      ),
                    ),
                  )
                : GridView.builder(
                    padding:
                        const EdgeInsets.only(
                          top: 20,
                        ),
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller
                            .data
                            .length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              2,
                          childAspectRatio:
                              0.7,
                          crossAxisSpacing:
                              10,
                          mainAxisSpacing:
                              10,
                        ),
                    itemBuilder: (context, index) {
                      return CustomListFavoriteItems(
                        favoriteModel:
                            controller
                                .data[index],
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
