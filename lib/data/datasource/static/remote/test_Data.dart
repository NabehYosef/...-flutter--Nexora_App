import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/data/datasource/static/linkapi.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData(
      AppLink.server,
      {},
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
