import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/address_data.dart';
import 'package:e_commerce/model/address_model.dart';
import 'package:get/get.dart';

class AddressViewController
    extends GetxController {
  AddressData addressData = AddressData(
    Get.find(),
  );

  List<AddressModel> data = [];

  late Statusrequest statusRequest;

  deleteAddress(
    String addressId,
  ) async {
    String token =
        await TokenStorage.getToken();
    await addressData.deleteData(
      addressId,
      token: token,
    );
    data.removeWhere(
      (element) =>
          element.id == addressId,
    );
    update();
  }

  getData() async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();

    var response = await addressData
        .getData(token: token);

    print(
      "=============================== Controller $response ",
    );

    statusRequest = handlingData(
      response,
    );

    if (Statusrequest.success ==
        statusRequest) {
      if (response['data'] != null) {
        List listdata =
            response['data'];
        data = listdata
            .map(
              (e) =>
                  AddressModel.fromJson(
                    e,
                  ),
            )
            .toList();
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
