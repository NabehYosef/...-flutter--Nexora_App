import 'package:e_commerce/controller/App/delivery_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/delivery/delivery_timeline.dart';
import 'package:e_commerce/view/widget/orders/order_status_badge.dart';
import 'package:e_commerce/view/widget/productdetails/soft_fade_slide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryController());
    return Scaffold(
      appBar: AppBar(
        title: Text("118".tr),
      ),
      body: GetBuilder<DeliveryController>(
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
                            "119".tr,
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
                      final shortId =
                          (order.id ??
                                      '')
                                  .length >
                              8
                          ? order.id!
                                .substring(
                                  order.id!.length -
                                      8,
                                )
                          : (order.id ??
                                '');
                      return SoftFadeSlide(
                        index: index,
                        child: Card(
                          margin:
                              const EdgeInsets.only(
                                bottom:
                                    12,
                              ),
                          child: InkWell(
                            onTap: () =>
                                controller.goToDetails(
                                  order,
                                ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(
                                    12,
                                  ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${"74".tr} #$shortId",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      OrderStatusBadge(
                                        status: order.status,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height:
                                        8,
                                  ),
                                  Text(
                                    "${"92".tr}: ${order.totalAmount ?? 0} \$",
                                    style: const TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Divider(),
                                  DeliveryTimeline(
                                    status:
                                        order.status,
                                  ),
                                ],
                              ),
                            ),
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
