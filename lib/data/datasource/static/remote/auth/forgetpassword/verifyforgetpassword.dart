import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class VerifyForgetPasswordData {
  Crud crud;
  VerifyForgetPasswordData(this.crud);

  Future<dynamic> post(
    String otp,
    String token,
  ) async {
    var response = await crud.postData(
      AppLink.resetpassword,
      {
        "otp": int.parse(otp),
        "newPassword": token,
      },
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
