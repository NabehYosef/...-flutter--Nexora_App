class CategoryModel {
  String? id;
  String? categoryName;
  String? image;

  CategoryModel({
    this.id,
    this.categoryName,
    this.image,
  });

  CategoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json['_id'];
    categoryName = json['categoryName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        {};
    data['_id'] = id;
    data['categoryName'] = categoryName;
    data['image'] = image;
    return data;
  }
}
