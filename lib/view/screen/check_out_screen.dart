import 'package:e_commerce/controller/App/check_out_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/controller/App/cart_controller.dart';
import 'package:e_commerce/view/widget/Cart/botton_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key})
    : super(key: key);

  @override
  State<Checkout> createState() =>
      _CheckoutState();
}

class _CheckoutState
    extends State<Checkout> {
  late CheckoutController controller;
  late CartControllerImp cartController;
  final TextEditingController
  notesController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = Get.put(
      CheckoutController(),
    );
    cartController =
        Get.find<CartControllerImp>();
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final num price =
        cartController.totalPrice;
    final num shipping =
        cartController.shippingCost;
    final num total =
        cartController.totalAfterCoupon;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppColor.primaryColor,
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          12.0,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Order summary',
              style: Theme.of(
                context,
              ).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextField(
              controller:
                  notesController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                        8,
                      ),
                ),
                hintText:
                    'Add delivery notes or instructions',
              ),
            ),
            const SizedBox(height: 20),
            Divider(),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                const Text('Subtotal'),
                Text(
                  '${price.toStringAsFixed(2)} \$',
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                const Text('Shipping'),
                Text(
                  '${shipping.toStringAsFixed(2)} \$',
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    color: AppColor
                        .primaryColor,
                  ),
                ),
                Text(
                  '${total.toStringAsFixed(2)} \$',
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    color: AppColor
                        .primaryColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GetBuilder<
              CheckoutController
            >(
              builder: (ctr) => CustomButtonCart(
                textbutton:
                    ctr.isProcessing
                    ? 'Processing...'
                    : 'Confirm Order',
                onPressed:
                    ctr.isProcessing
                    ? null
                    : () async {
                        await ctr.confirmOrder(
                          notes:
                              notesController
                                  .text,
                        );
                      },
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
