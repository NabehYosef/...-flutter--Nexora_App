import 'dart:io';
import 'package:e_commerce/controller/App/profile_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile
    extends StatelessWidget {
  const EditProfile({Key? key})
    : super(key: key);

  ImageProvider? _getProfileImage(
    ProfileController controller,
  ) {
    if (controller.pickedImagePath !=
        null) {
      return FileImage(
        File(
          controller.pickedImagePath!,
        ),
      );
    }

    final img =
        controller.data?.profileImage;
    if (img == null || img.isEmpty) {
      return null;
    }

    final url = img.startsWith("http")
        ? img
        : "${AppLink.imagesBaseUrl}/$img";

    return NetworkImage(url);
  }

  @override
  Widget build(BuildContext context) {
    ProfileController controller =
        Get.find();

    controller.userNameController ??=
        TextEditingController(
          text:
              controller.data?.userName,
        );
    controller.phoneController ??=
        TextEditingController(
          text: controller.data?.phone,
        );
    controller.passwordController ??=
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
        ),
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) => HandlingDataView(
          statusRequest:
              controller.statusRequest,
          widget: Padding(
            padding:
                const EdgeInsets.all(
                  20,
                ),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor:
                            Colors
                                .grey[200],
                        backgroundImage:
                            _getProfileImage(
                              controller,
                            ),
                        child:
                            _getProfileImage(
                                  controller,
                                ) ==
                                null
                            ? const Icon(
                                Icons
                                    .person,
                                size:
                                    55,
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            controller
                                .pickImage();
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.all(
                                  6,
                                ),
                            decoration: BoxDecoration(
                              color: AppColor
                                  .primaryColor,
                              shape: BoxShape
                                  .circle,
                              border: Border.all(
                                color: Colors
                                    .white,
                                width:
                                    2,
                              ),
                            ),
                            child: const Icon(
                              Icons
                                  .camera_alt,
                              color: Colors
                                  .white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: controller
                      .userNameController,
                  decoration: InputDecoration(
                    labelText: "الاسم",
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                            10,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller
                      .phoneController,
                  keyboardType:
                      TextInputType
                          .phone,
                  decoration: InputDecoration(
                    labelText:
                        "رقم الهاتف",
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                            10,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller
                      .passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText:
                        "كلمة المرور الجديدة (اتركه فارغ إذا لم تريد تغييرها)",
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                            10,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width:
                      double.infinity,
                  child: MaterialButton(
                    color: AppColor
                        .primaryColor,
                    textColor:
                        Colors.white,
                    padding:
                        const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                    onPressed: () {
                      controller
                          .updateProfile();
                    },
                    child: const Text(
                      "حفظ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
