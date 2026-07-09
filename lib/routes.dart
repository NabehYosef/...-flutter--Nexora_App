import 'package:e_commerce/controller/auth/signup/signup_controller.dart';
import 'package:e_commerce/controller/auth/signup/verfiycodesignup_controller.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/middleware/mymiddleware.dart';
import 'package:e_commerce/view/auth/SighnUp/success_signup.dart';
import 'package:e_commerce/view/auth/forgetpassword/forgetpassword.dart';
import 'package:e_commerce/view/auth/Login/login.dart';
import 'package:e_commerce/view/auth/forgetpassword/resetpassword.dart';
import 'package:e_commerce/view/auth/SighnUp/signup.dart';
import 'package:e_commerce/view/auth/forgetpassword/success_resetpass.dart';
import 'package:e_commerce/view/auth/SighnUp/verfiy_signup.dart';
import 'package:e_commerce/view/auth/forgetpassword/verifycodeforgetpass.dart';
import 'package:e_commerce/view/screen/App/Home.dart';
import 'package:e_commerce/view/screen/language.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //   name: "/",
  //   page: () => const TestView(),
  // ),
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [Mymiddleware()],
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoute.signUp,
    page: () => Signup(),
    binding: BindingsBuilder(() {
      Get.put(SignUpControllerImp());
    }),
  ),
  GetPage(
    name: AppRoute.Forgetpassword,
    page: () => const Forgetpassword(),
  ),
  GetPage(
    name: AppRoute.VerifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoute.ResetPassword,
    page: () => Resetpassword(),
  ),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () =>
        const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoute.SignUpSuccess,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRoute.onBoarding,
    page: () => const OnBoarding(),
  ),
  GetPage(
    name: AppRoute.verifyCodeSignup,
    page: () => VerifyCodeSignup(),
    binding: BindingsBuilder(() {
      Get.put(
        VerifyCodeSignUpControllerImp(),
      );
    }),
  ),
  //==================
  //app
  GetPage(
    name: AppRoute.HomeScreen,
    page: () => HomeScreen(),
  ),
];
//=================================
