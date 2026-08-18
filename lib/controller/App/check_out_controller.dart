import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/address_data.dart';
import 'package:e_commerce/data/datasource/static/remote/cart_data.dart';
import 'package:e_commerce/controller/App/cart_controller.dart';
import 'package:get/get.dart';

class CheckoutController
    extends GetxController {
  CartData cartData = CartData(
    Get.find(),
  );
  AddressData addressData = AddressData(
    Get.find(),
  );

  Statusrequest? statusRequest;
  bool isProcessing = false;

  Future<void> confirmOrder({
    String? notes,
  }) async {
    if (isProcessing) return;

    final CartControllerImp
    cartController = Get.find();
    if (cartController.data.isEmpty) {
      Get.snackbar(
        'Order',
        'Cart is empty',
      );
      return;
    }

    isProcessing = true;
    update();

    try {
      String token =
          await TokenStorage.getToken();

      var addressesResponse =
          await addressData.getData(
            token: token,
          );
      if (addressesResponse is! Map ||
          addressesResponse['data'] ==
              null ||
          addressesResponse['data']
              is! List ||
          (addressesResponse['data']
                  as List)
              .isEmpty) {
        Get.snackbar(
          'Order',
          'Please add a shipping address first',
        );
        return;
      }

      final List addresses =
          addressesResponse['data'];
      final String? shippingAddressId =
          addresses.first['_id']
              ?.toString();

      if (shippingAddressId == null ||
          shippingAddressId.isEmpty) {
        Get.snackbar(
          'Order',
          'Invalid shipping address',
        );
        return;
      }

      final String combinedNotes =
          '${(notes ?? '').trim().isEmpty ? '' : notes!.trim() + ' | '}Payment: Cash on Delivery';

      var response = await cartData
          .createOrder(
            shippingAddressId,
            notes: combinedNotes,
            discountCode: cartController
                .appliedCoupon,
            token: token,
          );

      if (response is Map &&
          response['orderId'] != null) {
        final finalTotal =
            response['finalTotal'];
        Get.snackbar(
          'Order',
          'Order created successfully${finalTotal != null ? ' - Total: $finalTotal' : ''}',
        );
        // clear coupon and refresh cart
        cartController.couponController
            .clear();
        cartController.appliedCoupon =
            null;
        await cartController.view();
        // navigate back to home
        Get.offAllNamed('/');
      } else {
        final message = response is Map
            ? (response['message']
                      ?.toString() ??
                  'Failed to create order')
            : 'Failed to create order';
        Get.snackbar('Order', message);
      }
    } finally {
      isProcessing = false;
      update();
    }
  }
}
