class OrderItemModel {
  String? id;
  String? productId;
  String? productName;
  num? price;
  num? quantity;

  OrderItemModel({
    this.id,
    this.productId,
    this.productName,
    this.price,
    this.quantity,
  });

  factory OrderItemModel.fromJson(
    Map<String, dynamic> json,
  ) {
    String? parsedProductId;
    String? parsedProductName;
    num? parsedPrice = json['price'];

    if (json['productId'] is Map) {
      final product =
          json['productId'] as Map;
      parsedProductId = product['_id']
          ?.toString();
      parsedProductName =
          product['productName']
              ?.toString();
      parsedPrice =
          parsedPrice ??
          product['price'];
    } else {
      parsedProductId =
          json['productId']?.toString();
    }

    return OrderItemModel(
      id: json['_id']?.toString(),
      productId: parsedProductId,
      productName: parsedProductName,
      price: parsedPrice,
      quantity: json['quantity'],
    );
  }
}

class OrderAddressModel {
  String? id;
  String? locationDetails;
  String? governorateName;

  OrderAddressModel({
    this.id,
    this.locationDetails,
    this.governorateName,
  });

  factory OrderAddressModel.fromJson(
    dynamic json,
  ) {
    if (json is! Map) {
      return OrderAddressModel(
        id: json?.toString(),
      );
    }

    String? governorateName;
    if (json['governorateId'] is Map) {
      governorateName =
          json['governorateId']['name']
              ?.toString();
    }

    return OrderAddressModel(
      id: json['_id']?.toString(),
      locationDetails:
          json['locationDetails']
              ?.toString(),
      governorateName: governorateName,
    );
  }
}

class OrderModel {
  String? id;
  String? status;
  String? notes;
  num? totalAmount;
  String? createdAt;
  List<OrderItemModel> items = [];
  OrderAddressModel? shippingAddress;

  OrderModel({
    this.id,
    this.status,
    this.notes,
    this.totalAmount,
    this.createdAt,
    List<OrderItemModel>? items,
    this.shippingAddress,
  }) : items = items ?? [];

  bool get canCancel =>
      (status ?? '').toLowerCase() ==
      'pending';

  factory OrderModel.fromJson(
    Map<String, dynamic> json,
  ) {
    List<OrderItemModel> parsedItems =
        [];
    if (json['items'] is List) {
      parsedItems = (json['items'] as List)
          .map(
            (e) =>
                OrderItemModel.fromJson(
                  Map<
                    String,
                    dynamic
                  >.from(e),
                ),
          )
          .toList();
    }

    return OrderModel(
      id:
          json['_id']?.toString() ??
          json['orderId']?.toString(),
      status: json['status']
          ?.toString(),
      notes: json['notes']?.toString(),
      totalAmount:
          json['totalAmount'] ??
          json['finalTotal'],
      createdAt: json['createdAt']
          ?.toString(),
      items: parsedItems,
      shippingAddress:
          json['shippingAddressId'] ==
              null
          ? null
          : OrderAddressModel.fromJson(
              json['shippingAddressId'],
            ),
    );
  }
}
