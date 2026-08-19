import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:get/get.dart';

class AddAddressController
    extends GetxController {
  Statusrequest statusRequest =
      Statusrequest.success;

  goToPageAddAddressDetails() {
    Get.toNamed(
      AppRoute.addressadddetails,
    );
  }

  // no additional initialization required
}
