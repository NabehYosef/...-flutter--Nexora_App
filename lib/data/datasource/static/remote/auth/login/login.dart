import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  Future<dynamic> post(
    String email,
    String password,
  ) async {
    var response = await crud.postData(
      AppLink.login,
      {
        "email": email,
        "password": password,
      },
    );

    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
