import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData({String? token}) async {
    var response = await crud.getData(
      AppLink.products,
      queryParams: {
        "page": "1",
        "limit": "1000",
      },
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  getCategories({String? token}) async {
    var response = await crud.getData(
      AppLink.categories,
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  searchProducts(
    String name, {
    String? token,
  }) async {
    var response = await crud.getData(
      AppLink.filterProducts,
      queryParams: {"name": name},
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
