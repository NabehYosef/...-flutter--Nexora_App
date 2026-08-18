import 'package:e_commerce/controller/App/order_details_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/delivery/delivery_timeline.dart';
import 'package:e_commerce/view/widget/orders/order_status_badge.dart';
import 'package:e_commerce/view/widget/productdetails/soft_fade_slide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails
    extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("77".tr),
      ),
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) => HandlingDataView(
          statusRequest:
              controller.statusRequest,
          widget:
              controller.order == null
              ? Center(
                  child: SoftFadeSlide(
                    child: Text(
                      "76".tr,
                    ),
                  ),
                )
              : ListView(
                  padding:
                      const EdgeInsets.all(
                        16,
                      ),
                  children: [
                    SoftFadeSlide(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${"74".tr} #${controller.order!.id ?? ''}",
                              style: const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                fontSize:
                                    16,
                              ),
                            ),
                          ),
                          OrderStatusBadge(
                            status: controller
                                .order!
                                .status,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SoftFadeSlide(
                      index: 1,
                      child: Text(
                        "93".tr,
                        style: const TextStyle(
                          fontWeight:
                              FontWeight
                                  .bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SoftFadeSlide(
                      index: 2,
                      child: DeliveryTimeline(
                        status:
                            controller
                                .order!
                                .status,
                      ),
                    ),
                    const Divider(),
                    SoftFadeSlide(
                      index: 3,
                      child: Text(
                        "91".tr,
                        style: const TextStyle(
                          fontWeight:
                              FontWeight
                                  .bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ...controller.order!.items.asMap().entries.map(
                      (
                        entry,
                      ) => SoftFadeSlide(
                        index:
                            4 +
                            entry.key,
                        child: ListTile(
                          contentPadding:
                              EdgeInsets
                                  .zero,
                          title: Text(
                            entry
                                    .value
                                    .productName ??
                                "94".tr,
                          ),
                          subtitle: Text(
                            "${"95".tr}: ${entry.value.quantity ?? 0}",
                          ),
                          trailing: Text(
                            "${entry.value.price ?? 0} \$",
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    SoftFadeSlide(
                      index: 6,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Text(
                            "66".tr,
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight
                                      .bold,
                              fontSize:
                                  16,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            controller
                                    .order!
                                    .shippingAddress
                                    ?.governorateName ??
                                "",
                          ),
                          Text(
                            controller
                                    .order!
                                    .shippingAddress
                                    ?.locationDetails ??
                                "96".tr,
                          ),
                          if ((controller
                                      .order!
                                      .notes ??
                                  '')
                              .isNotEmpty) ...[
                            const SizedBox(
                              height:
                                  12,
                            ),
                            Text(
                              "97".tr,
                              style: const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                            Text(
                              controller
                                  .order!
                                  .notes!,
                            ),
                          ],
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "${"92".tr}: ${controller.order!.totalAmount ?? 0} \$",
                            style: const TextStyle(
                              color: AppColor
                                  .primaryColor,
                              fontWeight:
                                  FontWeight
                                      .bold,
                              fontSize:
                                  18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (controller
                        .order!
                        .canCancel)
                      SoftFadeSlide(
                        index: 7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColor
                                    .primaryColor,
                            foregroundColor:
                                Colors
                                    .white,
                          ),
                          onPressed:
                              controller
                                      .cancelStatus ==
                                  Statusrequest
                                      .loading
                              ? null
                              : () {
                                  Get.defaultDialog(
                                    title:
                                        "39".tr,
                                    middleText:
                                        "78".tr,
                                    onConfirm: () {
                                      Get.back();
                                      controller.cancelOrder();
                                    },
                                    onCancel:
                                        () {},
                                    textConfirm:
                                        "41".tr,
                                    textCancel:
                                        "42".tr,
                                  );
                                },
                          child: Text(
                            "98".tr,
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
