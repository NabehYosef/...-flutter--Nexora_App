// lib/data/datasource/remote/auth/forgetpassword/reset_password.dart

import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  Future<dynamic> post(
    String otp,
    String newPassword,
    String token,
  ) async {
    var response = await crud.postData(
      AppLink.resetpassword,
      {
        "otp": int.parse(otp),
        "newPassword": newPassword,
      },
      token: token, //Header
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
