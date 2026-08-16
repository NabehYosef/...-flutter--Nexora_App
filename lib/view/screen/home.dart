import 'package:e_commerce/controller/App/home_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';
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
    return GetBuilder<
      HomeControllerImp
    >(
      builder: (controller) => PopScope(
        canPop: !controller.isSearch,
        onPopInvokedWithResult:
            (didPop, result) {
              if (!didPop &&
                  controller.isSearch) {
                controller
                    .searchController
                    ?.clear();
                controller.checkSearch(
                  "",
                );
              }
            },
        child: SafeArea(
          child: HandlingDataView(
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
                    mycontroller: controller
                        .searchController!,
                    onChanged: (val) =>
                        controller
                            .checkSearch(
                              val,
                            ),
                    onPressedSearch:
                        () => controller
                            .onSearchItems(),
                    onFieldSubmitted:
                        (
                          val,
                        ) => controller
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
                              fontSize:
                                  16,
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
                                width:
                                    50,
                                height:
                                    50,
                                fit: BoxFit
                                    .cover,
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
                    const CustomCardHome(
                      title:
                          "A summer surprise",
                      body:
                          "Cashback 20%",
                    ),
                    const CustomTitleHome(
                      title:
                          "Categories",
                    ),
                    const ListCategoriesHome(),
                    const CustomTitleHome(
                      title:
                          "Product for you",
                    ),
                    const ListItemsHome(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
