import 'package:e_commerce/Binding/initialBiding.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:e_commerce/core/localization/translation.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller =
        Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.Language,
      theme: controller.appTheme,
      // home: Test(), //
      initialBinding: InitialBinding(),
      initialRoute: "/",
      getPages: routes,
      //  routes: routes,
    );
  }
}
