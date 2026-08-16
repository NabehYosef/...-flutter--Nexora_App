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

  intialData() {
    governorateId =
        TextEditingController();
    locationDetails =
        TextEditingController();
  }

  addAddress() async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();

    var response = await addressData
        .addData(
          governorateId!.text,
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
        Get.offAllNamed(
          AppRoute.HomePage,
        );
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
