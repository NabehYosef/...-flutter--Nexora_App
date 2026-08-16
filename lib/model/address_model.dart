class AddressModel {
  String? id;
  String? userId;
  String? governorateId;
  String? governorateName;
  String? locationDetails;
  String? createdAt;
  String? updatedAt;

  AddressModel({
    this.id,
    this.userId,
    this.governorateId,
    this.governorateName,
    this.locationDetails,
    this.createdAt,
    this.updatedAt,
  });

  factory AddressModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AddressModel(
      id: json['_id'],
      userId: json['userId'],
      governorateId:
          json['governorateId'] is Map
          ? json['governorateId']['_id']
          : json['governorateId'],
      governorateName:
          json['governorateId'] is Map
          ? json['governorateId']['name']
          : null,
      locationDetails:
          json['locationDetails'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "governorateId": governorateId,
      "locationDetails":
          locationDetails,
    };
  }
}
