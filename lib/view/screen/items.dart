import 'package:e_commerce/controller/App/itemes_controller.dart';
import 'package:e_commerce/controller/App/favorite_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';
import 'package:e_commerce/view/widget/Item/listcategoryitems.dart';
import 'package:e_commerce/view/widget/customappbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    ItemsControllerImp controller =
        Get.put(ItemsControllerImp());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(
          15,
        ),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
            children: [
              CustomAppBar(
                titleappbar:
                    "Find Product",
                onPressedIcon: () {},
                onPressedSearch: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              const ListCategoriesItems(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 500,
                child: HandlingDataView(
                  statusRequest:
                      controller
                          .statusRequest,
                  widget: GridView.builder(
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller
                            .products
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
                      final product =
                          controller
                              .products[index];
                      return Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  child: Image.network(
                                    "${AppLink.imagesBaseUrl}/${(product.images?.first ?? '').replaceAll('\\', '/')}",
                                    fit:
                                        BoxFit.cover,
                                    width:
                                        double.infinity,
                                    height:
                                        double.infinity,
                                    errorBuilder:
                                        (
                                          context,
                                          error,
                                          stackTrace,
                                        ) => const Icon(
                                          Icons.image_not_supported,
                                        ),
                                  ),
                                ),
                                Positioned(
                                  top:
                                      5,
                                  right:
                                      5,
                                  child:
                                      GetBuilder<
                                        FavoriteControllerImp
                                      >(
                                        builder:
                                            (
                                              favController,
                                            ) {
                                              bool isFav =
                                                  favController.isFavorite[product.id] ??
                                                  false;
                                              return InkWell(
                                                onTap: () {
                                                  if (isFav) {
                                                    favController.removeFavorite(
                                                      product.id!,
                                                    );
                                                  } else {
                                                    favController.addFavorite(
                                                      product.id!,
                                                    );
                                                  }
                                                },
                                                child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: Colors.white,
                                                  child: Icon(
                                                    isFav
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    color: Colors.red,
                                                    size: 18,
                                                  ),
                                                ),
                                              );
                                            },
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${product.productName}",
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),
                          Text(
                            "${product.price} \$",
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
