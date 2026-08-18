import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusBadge
    extends StatelessWidget {
  final String? status;
  const OrderStatusBadge({
    super.key,
    this.status,
  });

  Color _color(String value) {
    switch (value) {
      case 'pending':
        return Colors.orange;
      case 'approved':
        return Colors.blue;
      case 'shipped':
        return Colors.deepPurple;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
      case 'rejected':
        return AppColor.primaryColor;
      default:
        return AppColor.grey;
    }
  }

  String _label(String value) {
    switch (value) {
      case 'pending':
        return "85".tr;
      case 'approved':
        return "86".tr;
      case 'shipped':
        return "87".tr;
      case 'delivered':
        return "88".tr;
      case 'cancelled':
        return "89".tr;
      case 'rejected':
        return "90".tr;
      default:
        return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final value = (status ?? '')
        .toLowerCase();
    final color = _color(value);
    return TweenAnimationBuilder<
      double
    >(
      tween: Tween(begin: 0.92, end: 1),
      duration: const Duration(
        milliseconds: 350,
      ),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
        decoration: BoxDecoration(
          color: color.withOpacity(
            0.12,
          ),
          borderRadius:
              BorderRadius.circular(20),
          border: Border.all(
            color: color,
          ),
        ),
        child: Text(
          _label(value),
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
