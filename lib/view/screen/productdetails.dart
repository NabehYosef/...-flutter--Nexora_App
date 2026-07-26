import 'package:e_commerce/controller/App/productdetails_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/productdetails/priceandcount.dart';
import 'package:e_commerce/view/widget/productdetails/subitemslist.dart';
import 'package:e_commerce/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails
    extends StatelessWidget {
  const ProductDetails({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      ProductDetailsControllerImp(),
    );

    return GetBuilder<
      ProductDetailsControllerImp
    >(
      builder: (controller) => Scaffold(
        bottomNavigationBar: Container(
          margin:
              const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
          height: 40,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(
                    10,
                  ),
            ),
            color: AppColor.secondColor,
            onPressed: () {},
            child: const Text(
              "Add To Cart",
              style: TextStyle(
                color: Colors.white,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            const TopProductPageDetails(),
            const SizedBox(height: 100),
            Container(
              padding:
                  const EdgeInsets.all(
                    20,
                  ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  Text(
                    "${controller.productModel.productName}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight
                              .bold,
                      color: AppColor
                          .fourthColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PriceAndCountItems(
                    onAdd: controller
                        .increaseCount,
                    onRemove: controller
                        .decreaseCount,
                    price:
                        "${controller.productModel.price}",
                    count:
                        "${controller.count}",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${controller.productModel.description}",
                    style:
                        const TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight
                                  .w300,
                          color: AppColor
                              .grey2,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (controller
                      .subitems
                      .isNotEmpty) ...[
                    const Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight
                                .bold,
                        color: AppColor
                            .fourthColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SubitemsList(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
