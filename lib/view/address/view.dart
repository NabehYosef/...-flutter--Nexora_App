import 'package:e_commerce/controller/address/view_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView
    extends StatelessWidget {
  const AddressView({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewController controller =
        Get.put(
          AddressViewController(),
        );
    return Scaffold(
      appBar: AppBar(
        title: const Text('address'),
      ),
      floatingActionButton:
          FloatingActionButton(
            onPressed: () {
              Get.toNamed(
                AppRoute.addressadd,
              );
            },
            child: Icon(Icons.add),
          ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) =>
            HandlingDataView(
              statusRequest: controller
                  .statusRequest,
              widget: Container(
                child: ListView.builder(
                  itemCount: controller
                      .data
                      .length,
                  itemBuilder: (context, i) {
                    return CardAddress(
                      addressModel:
                          controller
                              .data[i],
                      onDelete: () {
                        controller
                            .deleteAddress(
                              controller
                                  .data[i]
                                  .id!,
                            );
                      },
                    );
                  },
                ),
              ),
            ),
      ),
    );
  }
}

class CardAddress
    extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({
    Key? key,
    required this.addressModel,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            addressModel
                    .governorateName ??
                "",
          ),
          subtitle: Text(
            addressModel
                    .locationDetails ??
                "",
          ),
          trailing: IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete_outline,
            ),
          ),
        ),
      ),
    );
  }
}
