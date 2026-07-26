import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(
    String productId, {
    String? token,
  }) async {
    var response = await crud.postData(
      "${AppLink.addToFavourite}/$productId",
      {},
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  removeFavorite(
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
