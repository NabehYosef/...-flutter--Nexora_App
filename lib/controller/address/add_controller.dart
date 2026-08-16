import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AddAddressController
    extends GetxController {
  Statusrequest statusRequest =
      Statusrequest.loading;

  MapController mapController =
      MapController();

  List<Marker> markers = [];

  double? lat;
  double? long;

  Position? position;

  LatLng? currentCenter;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(
      Marker(
        point: latLng,
        width: 40,
        height: 40,
        child: const Icon(
          Icons.location_pin,
          color: Colors.red,
          size: 40,
        ),
      ),
    );
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(
      AppRoute.addressadddetails,
      arguments: {
        "lat": lat.toString(),
        "long": long.toString(),
      },
    );
  }

  goToMyLocation() {
    if (currentCenter != null) {
      mapController.move(
        currentCenter!,
        14.4746,
      );
    }
  }

  getCurrentLocation() async {
    bool serviceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        "خطأ",
        "فعّل خدمة الموقع (GPS) أولاً",
      );
      statusRequest =
          Statusrequest.failure;
      update();
      return;
    }

    LocationPermission permission =
        await Geolocator.checkPermission();
    if (permission ==
        LocationPermission.denied) {
      permission =
          await Geolocator.requestPermission();
      if (permission ==
          LocationPermission.denied) {
        Get.snackbar(
          "خطأ",
          "تم رفض صلاحية الموقع",
        );
        statusRequest =
            Statusrequest.failure;
        update();
        return;
      }
    }

    if (permission ==
        LocationPermission
            .deniedForever) {
      Get.snackbar(
        "خطأ",
        "الصلاحية مرفوضة بشكل دائم، فعّلها من إعدادات الجهاز",
      );
      statusRequest =
          Statusrequest.failure;
      update();
      return;
    }

    position =
        await Geolocator.getCurrentPosition();
    currentCenter = LatLng(
      position!.latitude,
      position!.longitude,
    );
    statusRequest = Statusrequest.none;
    update();

    mapController.move(
      currentCenter!,
      14.4746,
    );
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
}
