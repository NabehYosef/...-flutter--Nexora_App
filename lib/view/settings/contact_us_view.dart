import 'package:e_commerce/controller/settings/contact_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsView
    extends StatelessWidget {
  ContactUsView({super.key});

  final ContactUsController controller =
      Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF5F5F5,
      ),
      appBar: AppBar(
        backgroundColor: const Color(
          0xFFE04A3F,
        ),
        elevation: 0,
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            _buildContactTile(
              icon: Icons.phone,
              title: '57'.tr,
              subtitle: controller
                  .phoneNumber,
              onTap:
                  controller.callPhone,
            ),
            _buildContactTile(
              icon: Icons.chat,
              title: '58'.tr,
              subtitle: '59'.tr,
              onTap: controller
                  .openWhatsApp,
            ),
            _buildContactTile(
              icon: Icons.email,
              title: '60'.tr,
              subtitle:
                  controller.email,
              onTap:
                  controller.sendEmail,
            ),
            _buildContactTile(
              icon: Icons.facebook,
              title: '61'.tr,
              subtitle: '62'.tr,
              onTap: () =>
                  controller.openLink(
                    controller
                        .facebookUrl,
                  ),
            ),
            _buildContactTile(
              icon: Icons.camera_alt,
              title: '63'.tr,
              subtitle: '64'.tr,
              onTap: () =>
                  controller.openLink(
                    controller
                        .instagramUrl,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(
            0xFFE04A3F,
          ).withOpacity(0.1),
          child: Icon(
            icon,
            color: const Color(
              0xFFE04A3F,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}
