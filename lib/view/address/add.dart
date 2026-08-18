import 'package:e_commerce/controller/address/add_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class AddressAdd
    extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'add new address',
        ),
      ),
      body: GetBuilder<AddAddressController>(
        builder: ((controllerpage) => HandlingDataView(
          statusRequest: controllerpage
              .statusRequest,
          widget: Column(
            children: [
              if (controllerpage
                      .currentCenter !=
                  null)
                Expanded(
                  child: Stack(
                    alignment: Alignment
                        .center,
                    children: [
                      FlutterMap(
                        mapController:
                            controllerpage
                                .mapController,
                        options: MapOptions(
                          initialCenter:
                              controllerpage
                                  .currentCenter!,
                          initialZoom:
                              14.4746,
                          onTap:
                              (
                                tapPosition,
                                latlong,
                              ) {
                                controllerpage.addMarkers(
                                  latlong,
                                );
                              },
                          onMapReady: () {
                            // controllerpage
                            //     .onMapReady();
                          },
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                            userAgentPackageName:
                                "com.example.e_commerce",
                          ),
                          MarkerLayer(
                            markers:
                                controllerpage
                                    .markers,
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 70,
                        right: 10,
                        child: FloatingActionButton(
                          mini: true,
                          onPressed: () {
                            controllerpage
                                .goToMyLocation();
                          },
                          child: const Icon(
                            Icons
                                .my_location,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: MaterialButton(
                          minWidth: 200,
                          onPressed: () {
                            controllerpage
                                .goToPageAddDetailsAddress();
                          },
                          color: AppColor
                              .primaryColor,
                          textColor:
                              Colors
                                  .white,
                          child: Text(
                            "اكمال",
                            style: TextStyle(
                              fontSize:
                                  18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        )),
      ),
    );
  }
}
