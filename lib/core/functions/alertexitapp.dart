import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "39".tr,
    middleText: "40".tr,
    textCancel: "42".tr,
    textConfirm: "41".tr,
    onCancel: () {
      Get.back();
    },
    onConfirm: () {
      Get.back();
      // Exit the app
      // SystemNavigator.pop(); // Uncomment this line to exit the app
    },
  );
  return Future.value(
    false,
  ); // Prevent the default back button behavior
}
