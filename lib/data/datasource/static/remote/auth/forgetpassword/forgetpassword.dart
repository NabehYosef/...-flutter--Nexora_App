import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class ForgetPasswordData {
  Crud crud;

  ForgetPasswordData(this.crud);

  Future<dynamic> post(
    String email,
  ) async {
    var response = await crud.postData(
      AppLink.forgetpassword,
      {"email": email},
    );

    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
