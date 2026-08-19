import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
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
  bool isLoadingGovernorates = false;

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
    try {
      update();
    } catch (_) {}

    try {
      String token =
          await TokenStorage.getToken();

      String govId =
          selectedGovernorateId ?? '';
      if (govId.isEmpty) {
        try {
          govId =
              governorateId?.text ?? '';
        } catch (_) {
          govId = '';
        }
      }

      var response = await addressData
          .addData(
            govId,
            locationDetails!.text,
            token: token,
          );

      print(
        '=== AddAddress response: $response',
      );

      // If response is a Statusrequest (failure cases from Crud), use it directly.
      if (response is Statusrequest) {
        statusRequest = response;
      } else if (response is Map) {
        // Backend success shape may vary. Consider any map result as success
        // if it includes an 'address' key or a truthy success indicator.
        if (response['address'] !=
                null ||
            response['success'] ==
                true ||
            response['status'] ==
                'success') {
          // Navigate away immediately and return — avoid touching controller after disposal
          try {
            Get.offAllNamed(
              AppRoute.addressview,
            );
          } catch (_) {}
          return;
        } else {
          statusRequest =
              Statusrequest.failure;
          print(
            'Add address returned map but no address key: $response',
          );
        }
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    } catch (e, s) {
      print(
        'AddAddress exception: $e\n$s',
      );
      statusRequest =
          Statusrequest.failure;
    }

    // ensure UI updated
    try {
      update();
    } catch (_) {}
  }

  getGovernorates() async {
    isLoadingGovernorates = true;
    try {
      update();
    } catch (_) {}

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
        if (governorates.isNotEmpty) {
          final first =
              governorates.first;
          selectedGovernorateId =
              first['_id']
                  ?.toString() ??
              first['id']?.toString();
        }
      } else {
        print(
          'getGovernorates unexpected response: $response',
        );
      }
    } catch (e) {
      print(
        'getGovernorates exception: $e',
      );
    }

    isLoadingGovernorates = false;
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
