import 'package:e_commerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController
    extends GetxController {
  checkCode();
  // ignore: strict_top_level_inference
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp
    extends VerifyCodeSignUpController {
  late String verifycode;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp() {
    Get.offNamed(
      AppRoute.SignUpSuccess,
    );
  }

  @override
  void onInit() {
    super.onInit();
  }
}
