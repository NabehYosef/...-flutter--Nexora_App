import 'package:e_commerce/controller/address/adddetails_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/constant/color.dart';

class AddressAddDetails
    extends StatelessWidget {
  const AddressAddDetails({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      AddAddressDetailsController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'add details address',
        ),
        backgroundColor:
            AppColor.primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(
          15,
        ),
        child: GetBuilder<AddAddressDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller
                .statusRequest,
            widget: ListView(
              children: [
                // Governorate dropdown fetched from server
                if (controller
                    .governorates
                    .isEmpty)
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .stretch,
                    children: [
                      if (controller
                              .statusRequest ==
                          Statusrequest
                              .loading)
                        const Center(
                          child: Padding(
                            padding:
                                EdgeInsets.all(
                                  8.0,
                                ),
                            child:
                                CircularProgressIndicator(),
                          ),
                        )
                      else
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColor
                                    .primaryColor,
                          ),
                          onPressed: () {
                            controller
                                .getGovernorates();
                          },
                          child: const Text(
                            'Load governorates',
                          ),
                        ),
                    ],
                  )
                else
                  DropdownButtonFormField<
                    String
                  >(
                    value: controller
                        .selectedGovernorateId,
                    decoration: InputDecoration(
                      labelText:
                          'governorate',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                              30,
                            ),
                      ),
                    ),
                    items: controller
                        .governorates
                        .map<
                          DropdownMenuItem<
                            String
                          >
                        >((g) {
                          final id =
                              g['_id']
                                  ?.toString() ??
                              g['id']
                                  ?.toString();
                          final name =
                              g['name']
                                  ?.toString() ??
                              '';
                          return DropdownMenuItem(
                            value: id,
                            child: Text(
                              name,
                            ),
                          );
                        })
                        .toList(),
                    onChanged: (val) {
                      controller
                              .selectedGovernorateId =
                          val;
                      try {
                        if (controller
                                .governorateId !=
                            null) {
                          controller
                                  .governorateId!
                                  .text =
                              val ?? '';
                        }
                      } catch (_) {}
                      try {
                        controller
                            .update();
                      } catch (_) {}
                    },
                  ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    if (val == null ||
                        val.isEmpty) {
                      return "required";
                    }
                    return null;
                  },
                  controller: controller
                      .locationDetails!,
                  hintText:
                      "location details",
                  iconData:
                      Icons.streetview,
                  labelText:
                      "location details",
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColor
                            .primaryColor,
                    minimumSize:
                        const Size.fromHeight(
                          48,
                        ),
                  ),
                  onPressed: () {
                    controller
                        .addAddress();
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 16,
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
