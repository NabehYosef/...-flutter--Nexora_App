import 'package:e_commerce/controller/App/order_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/view/widget/orders/order_card.dart';
import 'package:e_commerce/view/widget/productdetails/soft_fade_slide.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text("75".tr),
      ),
      body: GetBuilder<OrdersController>(
        builder: (controller) => HandlingDataView(
          statusRequest:
              controller.statusRequest,
          widget: AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 350,
            ),
            child:
                controller.data.isEmpty
                ? Center(
                    key: const ValueKey(
                      'empty',
                    ),
                    child:
                        SoftFadeSlide(
                          child: Text(
                            "76".tr,
                          ),
                        ),
                  )
                : ListView.builder(
                    key: const ValueKey(
                      'list',
                    ),
                    padding:
                        const EdgeInsets.all(
                          12,
                        ),
                    itemCount:
                        controller
                            .data
                            .length,
                    itemBuilder: (context, index) {
                      final order =
                          controller
                              .data[index];
                      return SoftFadeSlide(
                        index: index,
                        child: OrderCard(
                          order: order,
                          onTap: () =>
                              controller
                                  .goToDetails(
                                    order,
                                  ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
