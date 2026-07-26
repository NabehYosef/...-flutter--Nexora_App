import 'package:e_commerce/model/productmodel.dart';

class FavoriteModel {
  String? id;
  String? listId;
  String? productId;

  // بعض الباك ايندات ترجع تفاصيل المنتج كاملة متداخلة (populate)
  // بمجرد ما تتأكد من شكل "Show Favourite List"، هذا الحقل بيتفعل تلقائياً
  ProductModel? product;

  String? createdAt;
  String? updatedAt;

  FavoriteModel({
    this.id,
    this.listId,
    this.productId,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  FavoriteModel.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json['_id'];
    listId = json['listId'];

    if (json['productId'] != null &&
        json['productId'] is Map) {
      product = ProductModel.fromJson(
        json['productId'],
      );
      productId = product?.id;
    } else {
      productId = json['productId'];
    }

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        {};
    data['_id'] = id;
    data['listId'] = listId;
    data['productId'] = productId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
