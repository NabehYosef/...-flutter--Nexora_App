import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/notification_data.dart';
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

  int get unreadCount => data
      .where((item) => !item.isRead)
      .length;

  getNotifications() async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();
    var response =
        await NotificationData.getNotifications(
          token: token,
        );

    statusRequest = handlingData(
      response,
    );

    if (statusRequest ==
            Statusrequest.success &&
        response is Map) {
      final raw =
          response['notifications'];
      if (raw is List) {
        data = raw
            .map(
              (e) =>
                  NotificationModel.fromJson(
                    Map<
                      String,
                      dynamic
                    >.from(e),
                  ),
            )
            .toList();
      } else {
        data = [];
      }
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
      data.removeWhere(
        (e) => e.id == id,
      );
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
      getNotifications();
      super.onInit();
    }
  }
}
