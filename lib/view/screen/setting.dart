import 'package:e_commerce/controller/App/setting_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/address/view.dart';
import 'package:e_commerce/view/settings/about_us_view.dart';
import 'package:e_commerce/view/settings/contact_us_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller =
        Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor
                    .primaryColor,
              ),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding:
                      EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(
                          100,
                        ),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor:
                        Colors
                            .grey[100],
                    backgroundImage:
                        AssetImage(
                          AppImageAsset
                              .avatar,
                        ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Container(
            padding:
                EdgeInsets.symmetric(
                  horizontal: 10,
                ),
            child: Card(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min,
                children: [
                  ListTile(
                    // onTap: () {},
                    trailing: Switch(
                      onChanged:
                          (val) {},
                      value: true,
                    ),
                    title: Text(
                      "Disable Notificatios",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(
                        AppRoute
                            .addressview,
                      );
                    },
                    trailing: Icon(
                      Icons
                          .location_on_outlined,
                    ),
                    title: Text(
                      "Address",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(
                        () =>
                            const AboutUs(),
                      );
                    },
                    trailing: Icon(
                      Icons
                          .help_outline_rounded,
                    ),
                    title: Text(
                      "About us",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(
                        () =>
                            ContactUsView(),
                      );
                    },
                    trailing: Icon(
                      Icons
                          .phone_callback_outlined,
                    ),
                    title: Text(
                      "Contact us",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      controller
                          .confirmLogout();
                    },
                    title: Text(
                      "Logout",
                    ),
                    trailing: Icon(
                      Icons.exit_to_app,
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
