import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/data/datasource/static/linkapi.dart';

class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);

  Future<dynamic> post(
    String token,
    int otp,
    String newPassword,
  ) async {
    var response = await crud.postData(
      AppLink.resetpassword,
      {
        "otp": otp,
        "newPassword": newPassword,
      },
      // headers: {
      //   "Authorization": "Bearer $token",
      // },
    );

    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
