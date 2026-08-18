class CartModel {
  String? productId;
  String? productName;
  num? price;
  num? quantity;
  String? color;
  num? subtotal;
  List<dynamic>? images;

  CartModel({
    this.productId,
    this.productName,
    this.price,
    this.quantity,
    this.color,
    this.subtotal,
    this.images,
  });

  CartModel.fromJson(
    Map<String, dynamic> json,
  ) {
    productId = json['productId'];
    productName = json['productName'];
    price = json['price'];
    quantity = json['quantity'];
    color = json['color'];
    subtotal = json['subtotal'];
    images = json['images'];
  }
}
