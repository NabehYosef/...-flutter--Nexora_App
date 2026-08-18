import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationItem
    extends StatelessWidget {
  final NotificationModel item;
  final void Function()? onTap;
  final void Function()? onDelete;
  const NotificationItem({
    super.key,
    required this.item,
    this.onTap,
    this.onDelete,
  });

  IconData _icon() {
    switch (item.type) {
      case "order":
        return Icons
            .local_shipping_outlined;
      case "discount":
        return Icons.percent;
      case "security":
        return Icons.lock_outline;
      default:
        return Icons
            .notifications_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction:
          DismissDirection.endToStart,
      onDismissed: (_) =>
          onDelete?.call(),
      background: Container(
        alignment:
            Alignment.centerRight,
        padding:
            const EdgeInsets.symmetric(
              horizontal: 20,
            ),
        color: AppColor.primaryColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 280,
          ),
          curve: Curves.easeOut,
          color: item.isRead
              ? Colors.white
              : AppColor.thirdColor
                    .withOpacity(0.35),
          padding:
              const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,
            children: [
              CircleAvatar(
                backgroundColor:
                    AppColor
                        .primaryColor
                        .withOpacity(
                          0.12,
                        ),
                child: Icon(
                  _icon(),
                  color: AppColor
                      .primaryColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      item.title ?? "",
                      style: TextStyle(
                        fontWeight:
                            item.isRead
                            ? FontWeight
                                  .w500
                            : FontWeight
                                  .bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      item.message ??
                          "",
                      style:
                          const TextStyle(
                            color:
                                AppColor
                                    .grey,
                            fontSize:
                                13,
                          ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      item.createdAt ??
                          "",
                      style:
                          const TextStyle(
                            color:
                                AppColor
                                    .grey,
                            fontSize:
                                11,
                          ),
                    ),
                  ],
                ),
              ),
              AnimatedScale(
                duration:
                    const Duration(
                      milliseconds: 250,
                    ),
                scale: item.isRead
                    ? 0
                    : 1,
                child: Container(
                  width: 8,
                  height: 8,
                  margin:
                      const EdgeInsets.only(
                        top: 6,
                      ),
                  decoration:
                      const BoxDecoration(
                        color: AppColor
                            .primaryColor,
                        shape: BoxShape
                            .circle,
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
