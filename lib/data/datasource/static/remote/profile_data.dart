import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);

  getData({
    required String token,
  }) async {
    var response = await crud.getData(
      AppLink.profile,
      token: token,
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  updateProfile(
    String userName,
    String phone, {
    required String token,
    String? imagePath,
    String? password,
  }) async {
    Map<String, String> fields = {
      "userName": userName,
      "phone": phone,
    };

    if (password != null) {
      fields["password"] = password;
    }

    var response = await crud
        .putMultipartData(
          AppLink.updateUser,
          fields,
          token: token,
          imageField: "profileImage",
          imagePath: imagePath,
        );

    print(
      "===== UPDATE PROFILE RESPONSE =====",
    );
    print(response);

    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
