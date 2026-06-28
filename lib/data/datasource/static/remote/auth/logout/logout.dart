import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class LogoutData {
  Crud crud;
  LogoutData(this.crud);

  Future<dynamic> post(
    String token,
  ) async {
    var response = await crud.postData(
      AppLink.logout,
      {},
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
