import 'dart:ui';

import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/Cart/botton_cart.dart';
import 'package:flutter/material.dart';

class BottomNavgationBarCart
    extends StatelessWidget {
  final num price;
  final num shipping;
  final num totalprice;
  final VoidCallback onPlaceOrder;

  const BottomNavgationBarCart({
    Key? key,
    required this.price,
    required this.shipping,
    required this.totalprice,
    required this.onPlaceOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                child: const Text(
                  "price",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                child: Text(
                  "$price \$",
                  style:
                      const TextStyle(
                        fontSize: 16,
                      ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                child: const Text(
                  "shipping",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                child: Text(
                  "$shipping \$",
                  style:
                      const TextStyle(
                        fontSize: 16,
                      ),
                ),
              ),
            ],
          ),

          const Divider(),

          Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                child: Text(
                  "Total Price",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                    color: AppColor
                        .primaryColor,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                child: Text(
                  "$totalprice \$",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                    color: AppColor
                        .primaryColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          CustomButtonCart(
            textbutton: "Place Order",
            onPressed: onPlaceOrder,
          ),
        ],
      ),
    );
  }
}
