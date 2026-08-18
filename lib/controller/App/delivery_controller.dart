import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/order_data.dart';
import 'package:e_commerce/model/order_model.dart';
import 'package:get/get.dart';

class DeliveryController
    extends GetxController {
  OrderData orderData = OrderData(
    Get.find(),
  );
  Statusrequest statusRequest =
      Statusrequest.none;
  List<OrderModel> data = [];

  bool _isActive(String? status) {
    final value = (status ?? '')
        .toLowerCase();
    return value == 'pending' ||
        value == 'approved' ||
        value == 'shipped';
  }

  getDeliveries() async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();
    var response = await orderData
        .getUserOrders(token: token);

    statusRequest = handlingData(
      response,
    );

    if (statusRequest ==
            Statusrequest.success &&
        response is Map) {
      if (response['orders'] is List) {
        List rawList =
            response['orders'];
        data = rawList
            .map(
              (e) =>
                  OrderModel.fromJson(
                    Map<
                      String,
                      dynamic
                    >.from(e),
                  ),
            )
            .where(
              (order) => _isActive(
                order.status,
              ),
            )
            .toList();
      } else {
        data = [];
      }
    }

    update();
  }

  goToDetails(OrderModel order) async {
    await Get.toNamed(
      AppRoute.orderdetails,
      arguments: {"orderId": order.id},
    );
    getDeliveries();
  }

  @override
  void onInit() {
    getDeliveries();
    super.onInit();
  }
}
