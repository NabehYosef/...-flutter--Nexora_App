import 'package:get/get_state_manager/get_state_manager.dart';

abstract class Onboardingcontroller
    extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp
    extends Onboardingcontroller {
  @override
  next() {}
  @override
  onPageChanged(int index) {}
}
