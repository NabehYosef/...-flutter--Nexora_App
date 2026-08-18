import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAddressDetailsController
    extends GetxController {
  Statusrequest statusRequest =
      Statusrequest.none;

  AddressData addressData = AddressData(
    Get.find(),
  );

  TextEditingController? governorateId;
  TextEditingController?
  locationDetails;
  List governorates = [];
  String? selectedGovernorateId;

  intialData() {
    governorateId =
        TextEditingController();
    locationDetails =
        TextEditingController();
    // Prefill locationDetails from navigation arguments if provided
    try {
      final args = Get.arguments;
      if (args != null && args is Map) {
        final lat =
            args['lat']?.toString() ??
            '';
        final long =
            args['long']?.toString() ??
            '';
        if (lat.isNotEmpty ||
            long.isNotEmpty) {
          locationDetails!.text =
              '$lat,$long';
        }
      }
    } catch (_) {}
    // start fetching governorates
    getGovernorates();
  }

  addAddress() async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();

    final String govId =
        selectedGovernorateId ??
        governorateId!.text;

    var response = await addressData
        .addData(
          govId,
          locationDetails!.text,
          token: token,
        );

    print(
      "=============================== Controller $response ",
    );

    statusRequest = handlingData(
      response,
    );

    if (Statusrequest.success ==
        statusRequest) {
      if (response['address'] != null) {
        // call update to reflect success state first
        update();
        // navigate away and return immediately to avoid using controller after it's disposed
        Get.offAllNamed(
          AppRoute.HomePage,
        );
        return;
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }
    // only update if still active
    try {
      update();
    } catch (_) {}
  }

  getGovernorates() async {
    try {
      String token =
          await TokenStorage.getToken();
      var response = await addressData
          .getGovernorates(
            token: token,
          );
      if (response is Map &&
          response['data'] != null) {
        governorates = response['data'];
        // if there's any, set default selected id
        if (governorates.isNotEmpty) {
          final first =
              governorates.first;
          selectedGovernorateId =
              first['_id']
                  ?.toString() ??
              first['id']?.toString();
        }
      }
    } catch (_) {}
    try {
      update();
    } catch (_) {}
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  void onClose() {
    governorateId?.dispose();
    locationDetails?.dispose();
    super.onClose();
  }
}
