import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);

  Future<dynamic> getData({required String token}) async {
    final response = await crud.getData(AppLink.profile, token: token);
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> updateProfile(
    String userName,
    String phone, {
    required String token,
    String? imagePath,
    String? password,
  }) async {
    final Map<String, String> fields = {"userName": userName, "phone": phone};

    if (password != null) {
      fields["password"] = password;
    }

    final response = await crud.putMultipartData(
      AppLink.updateUser,
      fields,
      token: token,
      imageField: "profileImage",
      imagePath: imagePath,
    );

    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> sendPhoneOtp({required String token}) async {
    final response = await crud.postData(AppLink.sendPhoneOtp, {}, token: token);
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> verifyPhoneOtp({
    required String token,
    required String otp,
  }) async {
    final response = await crud.postData(
      AppLink.verifyPhoneOtp,
      {"otp": otp},
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> resendPhoneOtp({required String token}) async {
    final response = await crud.postData(AppLink.resendPhoneOtp, {}, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
