import 'package:e_commerce/controller/App/setting_controller.dart';
import 'package:e_commerce/controller/auth/logout/logout_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/App/setting_avatar_header.dart';
import 'package:e_commerce/view/widget/App/setting_option_card.dart';
import 'package:e_commerce/view/widget/App/setting_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen
    extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      SettingsController(),
    );

    return Scaffold(
      backgroundColor:
          AppColor.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Container(
                  height: 210,
                  width:
                      double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColor
                        .primarycolor,
                    borderRadius:
                        BorderRadius.only(
                          bottomLeft:
                              Radius.circular(
                                24,
                              ),
                          bottomRight:
                              Radius.circular(
                                24,
                              ),
                        ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: AppColor
                        .background,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  const SettingsAvatarHeader(),
                  const SizedBox(
                    height: 28,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(
                              22,
                              0,
                              22,
                              22,
                            ),
                        child: SettingsOptionsCard(
                          children: [
                            Obx(
                              () => SettingsOptionTile(
                                title:
                                    'Disable Notifications',
                                trailing: Switch(
                                  value: controller
                                      .notificationsEnabled
                                      .value,
                                  onChanged:
                                      controller.toggleNotifications,
                                  activeThumbColor:
                                      AppColor.white,
                                  activeTrackColor:
                                      Colors.blue,
                                  inactiveThumbColor:
                                      AppColor.white,
                                  inactiveTrackColor:
                                      AppColor.grey,
                                ),
                              ),
                            ),
                            const SettingsOptionTile(
                              title:
                                  'Address',
                              trailing: Icon(
                                Icons
                                    .location_on,
                                color: Color(
                                  0xFF666666,
                                ),
                                size:
                                    30,
                              ),
                            ),
                            const SettingsOptionTile(
                              title:
                                  'About us',
                              trailing: Icon(
                                Icons
                                    .help_outline,
                                color: Color(
                                  0xFF666666,
                                ),
                                size:
                                    28,
                              ),
                            ),
                            const SettingsOptionTile(
                              title:
                                  'Contact us',
                              trailing: Icon(
                                Icons
                                    .call_outlined,
                                color: Color(
                                  0xFF666666,
                                ),
                                size:
                                    28,
                              ),
                            ),
                            GetBuilder<
                              LogoutControllerImp
                            >(
                              init:
                                  LogoutControllerImp(),
                              builder:
                                  (
                                    controller,
                                  ) => InkWell(
                                    onTap: () {
                                      controller.logout();
                                    },
                                    child: const SettingsOptionTile(
                                      title: 'Logout',
                                      isLast: true,
                                      trailing: Icon(
                                        Icons.logout_outlined,
                                        color: Color(
                                          0xFF666666,
                                        ),
                                        size: 28,
                                      ),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
