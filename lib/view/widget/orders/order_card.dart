import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/model/order_model.dart';
import 'package:e_commerce/view/widget/orders/order_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard
    extends StatelessWidget {
  final OrderModel order;
  final void Function()? onTap;
  const OrderCard({
    super.key,
    required this.order,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final shortId =
        (order.id ?? '').length > 8
        ? order.id!.substring(
            order.id!.length - 8,
          )
        : (order.id ?? '');

    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            12,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${"74".tr} #$shortId",
                      style: const TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  OrderStatusBadge(
                    status:
                        order.status,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "${order.items.length} ${"91".tr}",
                style: const TextStyle(
                  color: AppColor.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${"92".tr}: ${order.totalAmount ?? 0} \$",
                style: const TextStyle(
                  color: AppColor
                      .primaryColor,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
