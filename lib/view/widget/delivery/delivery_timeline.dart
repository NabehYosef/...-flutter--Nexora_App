import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryTimeline
    extends StatelessWidget {
  final String? status;
  const DeliveryTimeline({
    super.key,
    this.status,
  });

  int _step(String value) {
    switch (value) {
      case 'approved':
        return 1;
      case 'shipped':
        return 2;
      case 'delivered':
        return 3;
      case 'cancelled':
      case 'rejected':
        return -1;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final value = (status ?? 'pending')
        .toLowerCase();
    final current = _step(value);
    final steps = [
      "85".tr,
      "86".tr,
      "87".tr,
      "88".tr,
    ];

    if (current < 0) {
      return Text(
        value == 'cancelled'
            ? "89".tr
            : "90".tr,
        style: const TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Column(
      children: List.generate(steps.length, (
        index,
      ) {
        final done = index <= current;
        return TweenAnimationBuilder<
          double
        >(
          tween: Tween(
            begin: 0,
            end: 1,
          ),
          duration: Duration(
            milliseconds:
                350 + (index * 120),
          ),
          curve: Curves.easeOutCubic,
          builder:
              (
                context,
                valueAnim,
                child,
              ) {
                return Opacity(
                  opacity: valueAnim,
                  child: Transform.translate(
                    offset: Offset(
                      0,
                      10 *
                          (1 -
                              valueAnim),
                    ),
                    child: child,
                  ),
                );
              },
          child: ListTile(
            dense: true,
            contentPadding:
                EdgeInsets.zero,
            leading: AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 280,
              ),
              child: Icon(
                done
                    ? Icons.check_circle
                    : Icons
                          .radio_button_unchecked,
                key: ValueKey(done),
                color: done
                    ? Colors.green
                    : AppColor.grey,
              ),
            ),
            title: Text(
              steps[index],
              style: TextStyle(
                fontWeight: done
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: done
                    ? AppColor.black
                    : AppColor.grey,
              ),
            ),
          ),
        );
      }),
    );
  }
}
