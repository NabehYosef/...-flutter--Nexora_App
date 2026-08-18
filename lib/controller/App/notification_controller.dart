import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationsController
    extends GetxController {
  Statusrequest statusRequest =
      Statusrequest.success;
  List<NotificationModel> data = [];

  int get unreadCount => data
      .where((item) => !item.isRead)
      .length;

  loadDummyData() {
    statusRequest =
        Statusrequest.success;
    data = [
      NotificationModel(
        id: "1",
        title: "104".tr,
        message: "105".tr,
        type: "order",
        createdAt: "2m",
        isRead: false,
        orderId: "",
      ),
      NotificationModel(
        id: "2",
        title: "106".tr,
        message: "107".tr,
        type: "order",
        createdAt: "1h",
        isRead: false,
      ),
      NotificationModel(
        id: "3",
        title: "108".tr,
        message: "109".tr,
        type: "system",
        createdAt: "Yesterday",
        isRead: true,
      ),
      NotificationModel(
        id: "4",
        title: "110".tr,
        message: "111".tr,
        type: "discount",
        createdAt: "2d",
        isRead: true,
      ),
    ];
    update();
  }

  markAsRead(String id) {
    final index = data.indexWhere(
      (e) => e.id == id,
    );
    if (index == -1) return;
    data[index].isRead = true;
    update();
  }

  markAllAsRead() {
    for (final item in data) {
      item.isRead = true;
    }
    update();
  }

  deleteOne(String id) {
    data.removeWhere((e) => e.id == id);
    update();
  }

  deleteAll() {
    data.clear();
    update();
  }

  openNotification(
    NotificationModel item,
  ) {
    markAsRead(item.id ?? "");
    if ((item.orderId ?? "")
        .isNotEmpty) {
      Get.toNamed(
        AppRoute.orderdetails,
        arguments: {
          "orderId": item.orderId,
        },
      );
    }
  }

  @override
  void onInit() {
    loadDummyData();
    super.onInit();
  }
}
