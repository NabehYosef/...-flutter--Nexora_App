import 'package:e_commerce/controller/App/itemes_controller.dart';
import 'package:e_commerce/controller/App/favorite_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constant/routes.dart';
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
                mycontroller: controller
                    .searchController!,
                onChanged: (val) =>
                    controller
                        .checkSearch(
                          val,
                        ),
                onPressedSearch: () =>
                    controller
                        .onSearchItems(),
                onPressedIconFavorite:
                    () {
                      Get.toNamed(
                        AppRoute
                            .myfavroite,
                      );
                    },
              ),
              if (controller
                  .isSearch) ...[
                const SizedBox(
                  height: 20,
                ),
                if (controller
                    .searchResults
                    .isEmpty)
                  const Padding(
                    padding:
                        EdgeInsets.only(
                          top: 50,
                        ),
                    child: Center(
                      child: Text(
                        "لا توجد نتائج مطابقة",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors
                              .grey,
                        ),
                      ),
                    ),
                  )
                else
                  ...controller.searchResults.map(
                    (
                      product,
                    ) => InkWell(
                      onTap: () {
                        Get.toNamed(
                          AppRoute
                              .productdetails,
                          arguments: {
                            "productModel":
                                product,
                          },
                        );
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                          child: Image.network(
                            "${AppLink.imagesBaseUrl}/${(product.images?.first ?? '').replaceAll(RegExp(r'\\+'), '/')}",
                            width: 50,
                            height: 50,
                            fit: BoxFit
                                .cover,
                            errorBuilder:
                                (
                                  context,
                                  error,
                                  stackTrace,
                                ) => const Icon(
                                  Icons
                                      .image_not_supported,
                                ),
                          ),
                        ),
                        title: Text(
                          product.productName ??
                              "",
                        ),
                        subtitle: Text(
                          "${product.price} \$",
                        ),
                      ),
                    ),
                  ),
              ] else ...[
                const SizedBox(
                  height: 20,
                ),
                const ListCategoriesItems(),
                const SizedBox(
                  height: 20,
                ),
                HandlingDataView(
                  statusRequest:
                      controller
                          .statusRequest,
                  widget: GridView.builder(
                    shrinkWrap: true,
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
                      return InkWell(
                        onTap: () {
                          Get.toNamed(
                            AppRoute
                                .productdetails,
                            arguments: {
                              "productModel":
                                  product,
                            },
                          );
                        },
                        child: Column(
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
                                      "${AppLink.imagesBaseUrl}/${(product.images?.first ?? '').replaceAll(RegExp(r'\\+'), '/')}",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
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
                                        8,
                                    right:
                                        8,
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
                                                return GestureDetector(
                                                  behavior: HitTestBehavior.opaque,
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
                                                  child: Container(
                                                    padding: const EdgeInsets.all(
                                                      6,
                                                    ),
                                                    decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 4,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Icon(
                                                      isFav
                                                          ? Icons.favorite
                                                          : Icons.favorite_border,
                                                      color: Colors.red,
                                                      size: 26,
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
                                    FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${product.price} \$",
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
