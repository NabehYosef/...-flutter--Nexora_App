import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/data/datasource/static/linkapi.dart';

class VerifycodeOtp {
  Crud crud;

  VerifycodeOtp(this.crud);

  Future<dynamic> post(
    String email,
    String otp,
    String token,
  ) async {
    print("TOKEN INSIDE API = $token");

    var response = await crud.postData(
      AppLink.verifyOtp,
      {"email": email, "otp": otp},
      token: token,
    );

    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
