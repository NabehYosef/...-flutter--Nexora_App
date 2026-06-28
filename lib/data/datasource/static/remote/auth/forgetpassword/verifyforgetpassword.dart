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
      AppLink
          .resetpassword, // POST /api/auth/resetPassword
      {
        "otp": int.parse(
          otp,
        ), // السيرفر يتوقع رقم مو string
        "newPassword":
            token, // ← هذا مؤقت، راح نعدله في الخطوة 3
      },
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
