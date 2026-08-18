import 'package:e_commerce/controller/App/order_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/order_data.dart';
import 'package:e_commerce/model/order_model.dart';
import 'package:get/get.dart';

class OrderDetailsController
    extends GetxController {
  OrderData orderData = OrderData(
    Get.find(),
  );

  Statusrequest statusRequest =
      Statusrequest.none;
  Statusrequest cancelStatus =
      Statusrequest.none;
  OrderModel? order;
  late String orderId;

  getOrder() async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();
    var response = await orderData
        .getSingleOrder(
          orderId,
          token: token,
        );

    print(
      "=============================== OrderDetails $response ",
    );

    statusRequest = handlingData(
      response,
    );

    if (statusRequest ==
            Statusrequest.success &&
        response is Map) {
      if (response['order'] is Map) {
        order = OrderModel.fromJson(
          Map<String, dynamic>.from(
            response['order'],
          ),
        );
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }

    update();
  }

  cancelOrder() async {
    if (order == null ||
        !order!.canCancel) {
      Get.snackbar("73".tr, "79".tr);
      return;
    }

    cancelStatus =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();
    var response = await orderData
        .cancelOrder(
          orderId,
          token: token,
        );

    print(
      "=============================== CancelOrder $response ",
    );

    cancelStatus = handlingData(
      response,
    );

    if (cancelStatus ==
            Statusrequest.success &&
        response is Map) {
      Get.snackbar("73".tr, "80".tr);
      await getOrder();
      if (Get.isRegistered<
        OrdersController
      >()) {
        Get.find<OrdersController>()
            .getOrders();
      }
    } else {
      Get.snackbar("52".tr, "81".tr);
    }

    update();
  }

  @override
  void onInit() {
    final args = Get.arguments;
    orderId = args is Map
        ? (args['orderId']
                  ?.toString() ??
              '')
        : (args?.toString() ?? '');
    if (orderId.isEmpty) {
      statusRequest =
          Statusrequest.failure;
    } else {
      getOrder();
    }
    super.onInit();
  }
}
