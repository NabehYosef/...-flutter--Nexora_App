import 'package:e_commerce/controller/App/cart_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/view/widget/Cart/app_bar_cart.dart';
import 'package:e_commerce/view/widget/Cart/custom_buttom_navigatiobar_cart.dart';
import 'package:e_commerce/view/widget/Cart/custom_items_cart.dart';
import 'package:e_commerce/view/widget/Cart/top_card_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartControllerImp cartController =
        Get.put(CartControllerImp());
    return Scaffold(
      bottomNavigationBar:
          GetBuilder<CartControllerImp>(
            builder: (controller) =>
                BottomNavgationBarCart(
                  price:
                      "${controller.totalPrice}",
                  shipping: "300",
                  totalprice:
                      "${controller.totalPrice + 300}",
                ),
          ),
      body: GetBuilder<CartControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest:
              controller.statusRequest,
          widget: ListView(
            children: [
              const TopAppbarCart(
                title: 'My Cart',
              ),
              const SizedBox(
                height: 10,
              ),
              TopCardCart(
                message:
                    "You Have ${controller.data.length} Items in Your List",
              ),
              Container(
                padding:
                    const EdgeInsets.all(
                      10,
                    ),
                child: Column(
                  children: [
                    ...List.generate(
                      controller
                          .data
                          .length,
                      (index) {
                        final item =
                            controller
                                .data[index];
                        return CustomItemsCartList(
                          onAdd: () async {
                            if (item.productId !=
                                null) {
                              await controller.updateQuantity(
                                item.productId!,
                                item.color ??
                                    "",
                                (item.quantity ??
                                            1)
                                        .toInt() +
                                    1,
                              );
                            }
                          },

                          onRemove: () async {
                            if (item.productId !=
                                null) {
                              if ((item.quantity ??
                                      1) >
                                  1) {
                                await controller.updateQuantity(
                                  item.productId!,
                                  item.color ??
                                      "",
                                  (item.quantity ??
                                              1)
                                          .toInt() -
                                      1,
                                );
                              } else {
                                await controller.removeItem(
                                  item.productId!,
                                  item.color ??
                                      "",
                                );
                              }
                            }
                          },
                          imagename:
                              (item.images !=
                                      null &&
                                  item
                                      .images!
                                      .isNotEmpty)
                              ? item.images![0].replaceAll(
                                  r'\',
                                  '/',
                                )
                              : "",
                          name:
                              "${item.productName}",
                          price:
                              "${item.price} \$",
                          count:
                              "${item.quantity}",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
