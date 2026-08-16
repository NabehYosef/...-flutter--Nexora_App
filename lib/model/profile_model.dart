class ProfileModel {
  String? id;
  String? email;
  String? userName;
  String? birthDate;
  String? phone;
  bool? phoneVerified;
  String? profileImage;

  ProfileModel({
    this.id,
    this.email,
    this.userName,
    this.birthDate,
    this.phone,
    this.phoneVerified,
    this.profileImage,
  });

  factory ProfileModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProfileModel(
      id: json['_id'],
      email: json['email'],
      userName: json['userName'],
      birthDate: json['birthDate'],
      phone: json['phone'],
      phoneVerified:
          json['phoneVerified'],
      profileImage:
          json['profileImage'],
    );
  }
}
