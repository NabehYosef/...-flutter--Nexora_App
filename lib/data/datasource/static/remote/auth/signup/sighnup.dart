import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/data/datasource/static/linkapi.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  Future<dynamic> post(
    String email,
    String username,
    String password,
    String phone,
    String birthDate,
  ) async {
    var response = await crud
        .postData(AppLink.signup, {
          "email": email,
          "userName": username,
          "password": password,
          "phone": phone,
          "birthDate": birthDate,
        });

    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
