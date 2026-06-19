import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/middleware/mymiddleware.dart';
import 'package:e_commerce/view/Home.dart';
import 'package:e_commerce/view/auth/forgetpassword/forgetpassword.dart';
import 'package:e_commerce/view/auth/login.dart';
import 'package:e_commerce/view/auth/forgetpassword/resetpassword.dart';
import 'package:e_commerce/view/auth/signup.dart';
import 'package:e_commerce/view/auth/forgetpassword/success_resetpass.dart';
import 'package:e_commerce/view/auth/success_signup.dart';
import 'package:e_commerce/view/auth/verifycode.dart';
import 'package:e_commerce/view/auth/verifysighup.dart';
import 'package:e_commerce/view/screen/language.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
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
  ),
  GetPage(
    name: AppRoute.forgetPassword,
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
    name: AppRoute.VerifyCodeSignup,
    page: () => VerifyCodeSignup(),
  ),
  //==================
  //app
  GetPage(
    name: AppRoute.Home,
    page: () => Home(),
  ),
];
//=================================
