import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class SettingsOptionsCard
    extends StatelessWidget {
  final List<Widget> children;

  const SettingsOptionsCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius:
            BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withValues(
                  alpha: 0.08,
                ),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
