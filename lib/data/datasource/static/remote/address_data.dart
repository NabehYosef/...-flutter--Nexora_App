import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getData({
    required String token,
  }) async {
    var response = await crud.getData(
      AppLink.addressView,
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  getGovernorates({
    String? token,
  }) async {
    var response = await crud.getData(
      AppLink.governorates,
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  addData(
    String governorateId,
    String locationDetails, {
    required String token,
  }) async {
    var response = await crud.postData(
      AppLink.addressAdd,
      {
        "governorateId": governorateId,
        "locationDetails":
            locationDetails,
      },
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  deleteData(
    String addressId, {
    required String token,
  }) async {
    var response = await crud.postData(
      AppLink.addressDelete,
      {"addressId": addressId},
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
