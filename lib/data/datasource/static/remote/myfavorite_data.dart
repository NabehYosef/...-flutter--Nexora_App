import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  getData({String? token}) async {
    var response = await crud.getData(
      AppLink.showFavouriteList,
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  deleteData(
    String productId, {
    String? token,
  }) async {
    var response = await crud.deleteData(
      "${AppLink.removeFromFavourite}/$productId",
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
