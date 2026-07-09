import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsController
    extends GetxController {
  final String phoneNumber =
      '+963 942 298 082';
  final String whatsappNumber =
      '0942298082';
  final String email =
      'nabehy119@gmail.com';
  final String facebookUrl =
      'https://facebook.com/yourpage';
  final String instagramUrl =
      'https://www.instagram.com/nabeh119?igsh=MWl3YXkxcnM3ejdndA%3D%3D&utm_source=qr';

  Future<void> callPhone() async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar("52".tr, "53".tr);
    }
  }

  // فتح واتساب
  Future<void> openWhatsApp() async {
    final Uri uri = Uri.parse(
      'https://wa.me/$whatsappNumber',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode
            .externalApplication,
      );
    } else {
      Get.snackbar('52'.tr, "54".tr);
    }
  }

  Future<void> sendEmail() async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=استفسار من التطبيق',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar('52'.tr, '55'.tr);
    }
  }

  Future<void> openLink(
    String url,
  ) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode
            .externalApplication,
      );
    } else {
      Get.snackbar('52'.tr, '56'.tr);
    }
  }
}
