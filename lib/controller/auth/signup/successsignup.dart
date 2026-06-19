import 'package:e_commerce/core/constant/routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class SuccessSignUpController
    extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp
    extends SuccessSignUpController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
