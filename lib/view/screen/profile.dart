import 'package:e_commerce/controller/App/profile_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller =
        Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            onPressed: () {
              Get.toNamed(
                AppRoute.editprofile,
              );
            },
          ),
        ],
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) => HandlingDataView(
          statusRequest:
              controller.statusRequest,
          widget:
              controller.data == null
              ? const SizedBox()
              : ListView(
                  padding:
                      const EdgeInsets.all(
                        20,
                      ),
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            Colors
                                .grey[200],
                        backgroundImage:
                            (controller.data!.profileImage !=
                                    null &&
                                controller
                                    .data!
                                    .profileImage!
                                    .isNotEmpty)
                            ? NetworkImage(
                                "${AppLink.imagesBaseUrl}/images/${controller.data!.profileImage}",
                              )
                            : null,
                        child:
                            (controller.data!.profileImage ==
                                    null ||
                                controller
                                    .data!
                                    .profileImage!
                                    .isEmpty)
                            ? const Icon(
                                Icons
                                    .person,
                                size:
                                    50,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    _ProfileField(
                      label: "الاسم",
                      value:
                          controller
                              .data!
                              .userName ??
                          "",
                    ),
                    _ProfileField(
                      label: "الإيميل",
                      value:
                          controller
                              .data!
                              .email ??
                          "",
                    ),
                    _ProfileField(
                      label:
                          "رقم الهاتف",
                      value:
                          controller
                              .data!
                              .phone ??
                          "",
                    ),
                    _ProfileField(
                      label:
                          "تاريخ الميلاد",
                      value:
                          controller
                                  .data!
                                  .birthDate !=
                              null
                          ? DateFormat(
                              'yyyy-MM-dd',
                            ).format(
                              DateTime.parse(
                                controller
                                    .data!
                                    .birthDate!,
                              ),
                            )
                          : "",
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _ProfileField
    extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileField({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius:
            BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
