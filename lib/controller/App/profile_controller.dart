import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/profile_data.dart';
import 'package:e_commerce/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController
    extends GetxController {
  ProfileData profileData = ProfileData(
    Get.find(),
  );

  ProfileModel? data;

  late Statusrequest statusRequest;

  TextEditingController?
  userNameController;
  TextEditingController?
  phoneController;
  String? pickedImagePath;
  TextEditingController?
  passwordController;

  pickImage() async {
    final picker = ImagePicker();
    final picked = await picker
        .pickImage(
          source: ImageSource.gallery,
        );
    if (picked != null) {
      pickedImagePath = picked.path;
      update();
    }
  }

  getData() async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();
    var response = await profileData
        .getData(token: token);

    statusRequest = handlingData(
      response,
    );

    if (Statusrequest.success ==
        statusRequest) {
      if (response['user'] != null) {
        data = ProfileModel.fromJson(
          response['user'],
        );
        userNameController =
            TextEditingController(
              text: data!.userName,
            );
        phoneController =
            TextEditingController(
              text: data!.phone,
            );
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }
    update();
  }

  updateProfile() async {
    statusRequest =
        Statusrequest.loading;
    update();

    String token =
        await TokenStorage.getToken();

    var response = await profileData
        .updateProfile(
          userNameController!.text,
          phoneController!.text,
          token: token,
          imagePath: pickedImagePath,
          password:
              passwordController!.text
                  .trim()
                  .isEmpty
              ? null
              : passwordController!.text
                    .trim(),
        );

    statusRequest = handlingData(
      response,
    );

    if (Statusrequest.success ==
        statusRequest) {
      if (response['user'] != null) {
        data = ProfileModel.fromJson(
          response['user'],
        );
        pickedImagePath = null;
        passwordController!.clear();
        Get.back();
        Get.snackbar(
          "تم",
          "تم تحديث البيانات بنجاح",
        );
      } else {
        statusRequest =
            Statusrequest.failure;
      }
    }
    update();
  }

  removeImage() {
    pickedImagePath = null;
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    userNameController?.dispose();
    phoneController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }
}
