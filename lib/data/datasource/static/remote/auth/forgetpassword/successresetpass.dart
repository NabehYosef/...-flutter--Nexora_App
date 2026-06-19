import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class VerifyCodeResetPasswordData {
  Crud crud;

  VerifyCodeResetPasswordData(
    this.crud,
  );

  Future<dynamic> postData(
    String otp,
    String token,
  ) async {
    var response = await crud.postData(
      AppLink.verifyOtp,
      {"otp": otp},
    );

    print("OTP SENT ========");
    print(otp);

    print("TOKEN IN HEADER ========");
    print(token);

    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
