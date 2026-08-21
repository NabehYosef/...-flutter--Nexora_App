import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/login/login.dart';
import 'package:e_commerce/data/datasource/static/remote/profile_data.dart';
import 'package:e_commerce/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  ProfileData profileData = ProfileData(Get.find());
  final LoginData loginData = LoginData(Get.find());

  ProfileModel? data;

  late Statusrequest statusRequest;

  TextEditingController? userNameController;
  TextEditingController? phoneController;
  String? pickedImagePath;
  TextEditingController? passwordController;
  TextEditingController? oldPasswordController;
  TextEditingController? confirmPasswordController;

  String? pendingPhoneNumber;

  bool get hasPasswordChangeRequested =>
      (oldPasswordController?.text.trim().isNotEmpty ?? false) ||
      (passwordController?.text.trim().isNotEmpty ?? false) ||
      (confirmPasswordController?.text.trim().isNotEmpty ?? false);

  Future<bool> verifyOldPassword() async {
    final oldPassword = oldPasswordController?.text.trim() ?? "";
    final newPassword = passwordController?.text.trim() ?? "";
    final confirmPassword = confirmPasswordController?.text.trim() ?? "";

    if (!hasPasswordChangeRequested) {
      return true;
    }

    if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "Please fill in old password, new password and confirm password");
      return false;
    }

    if (newPassword.length < 6) {
      Get.snackbar("Error", "New password must be at least 6 characters");
      return false;
    }

    if (newPassword != confirmPassword) {
      Get.snackbar("Error", "New password and confirm password do not match");
      return false;
    }

    if (oldPassword == newPassword) {
      Get.snackbar("Error", "New password must be different from the old password");
      return false;
    }

    final email = data?.email;
    if (email == null || email.isEmpty) {
      Get.snackbar("Error", "Unable to verify your account");
      return false;
    }

    final response = await loginData.post(email, oldPassword);
    if (response is Map && response['token'] != null) {
      return true;
    }

    Get.snackbar("Error", "Old password is incorrect");
    return false;
  }

  Future<void> startPhoneVerification() async {
    final newPhone = phoneController?.text.trim() ?? "";
    final currentPhone = data?.phone?.trim() ?? "";

    if (newPhone.isEmpty) {
      Get.snackbar("Error", "Please enter your phone number");
      return;
    }

    if (newPhone == currentPhone) {
      await updateProfile();
      return;
    }

    final token = await TokenStorage.getToken();

    final updateResponse = await profileData.updateProfile(
      userNameController!.text,
      newPhone,
      token: token,
      imagePath: pickedImagePath,
      password: passwordController?.text.trim().isEmpty ?? true
          ? null
          : passwordController!.text.trim(),
    );

    if (updateResponse is! Map || updateResponse['user'] == null) {
      Get.snackbar("Error", "Failed to update phone number");
      return;
    }

    pendingPhoneNumber = newPhone;

    final otpResponse = await profileData.sendPhoneOtp(token: token);
    if (otpResponse is Map && otpResponse['message'] != null) {
      Get.toNamed(
        AppRoute.verifyPhoneChange,
        arguments: {"phone": newPhone},
      );
      return;
    }

    pendingPhoneNumber = null;
    Get.snackbar("Error", "Failed to send verification code");
  }

  Future<void> resendPhoneOtp() async {
    if (pendingPhoneNumber == null) {
      Get.snackbar("Error", "No phone verification is pending");
      return;
    }

    final token = await TokenStorage.getToken();
    final response = await profileData.resendPhoneOtp(token: token);

    if (response is Map && response['message'] != null) {
      Get.snackbar("تم", "تم إرسال الرمز مرة أخرى");
      return;
    }

    Get.snackbar("Error", "Unable to resend verification code");
  }

  Future<void> verifyPhoneChange(String enteredCode) async {
    if (pendingPhoneNumber == null) {
      Get.snackbar("Error", "No phone verification is pending");
      return;
    }

    final otp = enteredCode.trim();
    if (otp.isEmpty) {
      Get.snackbar("Error", "Please enter the verification code");
      return;
    }

    final token = await TokenStorage.getToken();
    final response = await profileData.verifyPhoneOtp(
      token: token,
      otp: otp,
    );

    if (response is Map &&
        (response['message']?.toString().toLowerCase().contains('verified') ??
            false)) {
      if (phoneController != null) {
        phoneController!.text = pendingPhoneNumber!;
      }
      if (data != null) {
        data!.phone = pendingPhoneNumber!;
      }

      pendingPhoneNumber = null;
      Get.back();
      Get.snackbar("تم", "تم تأكيد رقم الهاتف بنجاح");
      return;
    }

    Get.snackbar("Error", "Phone verification failed");
  }

  Future<void> pickImage() async {
  final picker = ImagePicker();
  final picked = await picker.pickImage(source: ImageSource.gallery);
  if (picked != null) {
    pickedImagePath = picked.path;
    removePhoto = false;
    update();
  }
}
bool removePhoto = false;

  void removeImage() {
    pickedImagePath = null;
    update();
  }
void pickImageAgainAfterRemove() {
  removePhoto = false; 
}
  Future<void> getData() async {
    statusRequest = Statusrequest.loading;
    update();

    String token = await TokenStorage.getToken();
    var response = await profileData.getData(token: token);

    statusRequest = handlingData(response);

    if (Statusrequest.success == statusRequest) {
      if (response['user'] != null) {
        data = ProfileModel.fromJson(response['user']);
        userNameController = TextEditingController(text: data!.userName);
        phoneController = TextEditingController(text: data!.phone);
        passwordController = TextEditingController();
        oldPasswordController = TextEditingController();
        confirmPasswordController = TextEditingController();
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  Future<void> updateProfile() async {
    final shouldVerifyPassword = hasPasswordChangeRequested;
    if (shouldVerifyPassword) {
      final verified = await verifyOldPassword();
      if (!verified) {
        return;
      }
    }

    statusRequest = Statusrequest.loading;
    update();

    String token = await TokenStorage.getToken();

    var response = await profileData.updateProfile(
      userNameController!.text,
      phoneController!.text,
      token: token,
      imagePath: pickedImagePath,
      password: passwordController?.text.trim().isEmpty ?? true
          ? null
          : passwordController!.text.trim(),
    );

    statusRequest = handlingData(response);

    if (Statusrequest.success == statusRequest) {
      if (response['user'] != null) {
        data = ProfileModel.fromJson(response['user']);
        pickedImagePath = null;
        passwordController!.clear();
        oldPasswordController!.clear();
        confirmPasswordController!.clear();
        Get.back();
        Get.snackbar("تم", "تم تحديث البيانات بنجاح");
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
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
    oldPasswordController?.dispose();
    confirmPasswordController?.dispose();
    super.onClose();
  }
}
