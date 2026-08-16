import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(
    String categoryName, {
    String? token,
  }) async {
    var response = await crud.getData(
      AppLink.filterProducts,
      queryParams: {
        "category": categoryName,
      },
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
