import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class OrderData {
  Crud crud;
  OrderData(this.crud);

  getUserOrders({
    required String token,
    int page = 1,
    int limit = 20,
  }) async {
    var response = await crud.getData(
      AppLink.userOrders,
      queryParams: {
        "page": "$page",
        "limit": "$limit",
      },
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  getSingleOrder(
    String orderId, {
    required String token,
  }) async {
    var response = await crud.getData(
      "${AppLink.singleOrder}/$orderId",
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  createOrder({
    required String shippingAddressId,
    String notes = "",
    required String token,
  }) async {
    var response = await crud
        .postData(AppLink.createOrder, {
          "shippingAddressId":
              shippingAddressId,
          "notes": notes,
        }, token: token);
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  cancelOrder(
    String orderId, {
    required String token,
  }) async {
    var response = await crud.putData(
      "${AppLink.cancelOrder}/$orderId",
      {"orderId": orderId},
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
