class CategoryModel {
  String? id;
  String? categoryName;

  CategoryModel({
    this.id,
    this.categoryName,
  });

  CategoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json['_id'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        {};
    data['_id'] = id;
    data['categoryName'] = categoryName;
    return data;
  }
}

class ProductModel {
  String? id;
  String? productName;
  String? description;
  num? price;
  num? stock;
  num? averageRating;
  List<String>? images;
  List<String>? colors;
  CategoryModel? category;
  String? createdAt;
  String? updatedAt;

  ProductModel({
    this.id,
    this.productName,
    this.description,
    this.price,
    this.stock,
    this.averageRating,
    this.images,
    this.colors,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json['_id'];
    productName = json['productName'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    averageRating =
        json['averageRating'];

    if (json['images'] != null) {
      images = List<String>.from(
        json['images'],
      );
    }

    if (json['colors'] != null) {
      colors = List<String>.from(
        json['colors'],
      );
    }

    if (json['category'] != null &&
        json['category'] is Map) {
      category = CategoryModel.fromJson(
        json['category'],
      );
    }

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        {};
    data['_id'] = id;
    data['productName'] = productName;
    data['description'] = description;
    data['price'] = price;
    data['stock'] = stock;
    data['averageRating'] =
        averageRating;
    data['images'] = images;
    data['colors'] = colors;
    if (category != null) {
      data['category'] = category!
          .toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
