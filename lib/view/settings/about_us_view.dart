import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF7F7FB,
      ),
      appBar: AppBar(
        backgroundColor:
            AppColor.primaryColor,
        elevation: 0,
        title: const Text(
          "About Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 24,
                  ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment
                      .topCenter,
                  end: Alignment
                      .bottomCenter,
                  colors: [
                    AppColor
                        .primaryColor,
                    AppColor
                        .primaryColor,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color:
                          Colors.white,
                      borderRadius:
                          BorderRadius.circular(
                            24,
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors
                              .black
                              .withOpacity(
                                0.2,
                              ),
                          blurRadius:
                              16,
                          offset:
                              const Offset(
                                0,
                                6,
                              ),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons
                          .shopping_bag_rounded,
                      size: 46,
                      color: AppColor
                          .primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Nexora App",
                    style: TextStyle(
                      color:
                          Colors.white,
                      fontSize: 22,
                      fontWeight:
                          FontWeight
                              .w700,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Version 1.0.0",
                    style: TextStyle(
                      color: Colors
                          .white
                          .withOpacity(
                            0.7,
                          ),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Description Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  Text(
                    "70".tr,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight
                              .w700,
                      color: AppColor
                          .primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '71'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.7,
                      color: Colors
                          .grey
                          .shade700,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Info Cards
            Padding(
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
              child: Column(
                children: [
                  _InfoTile(
                    icon: Icons
                        .email_outlined,
                    title: '60'.tr,
                    subtitle:
                        "nabehy119@gmail.com",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _InfoTile(
                    icon: Icons
                        .phone_outlined,
                    title: '65'.tr,
                    subtitle:
                        "+963 942 298 082",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _InfoTile(
                    icon: Icons
                        .location_on_outlined,
                    title: "66".tr,
                    subtitle: "67".tr,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _InfoTile(
                    icon: Icons
                        .language_outlined,
                    title: "68".tr,
                    subtitle: "69".tr,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Social Media Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  Text(
                    '72'.tr,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight
                              .w700,
                      color: AppColor
                          .primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      _SocialIcon(
                        icon: Icons
                            .facebook,
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      _SocialIcon(
                        icon: Icons
                            .camera_alt_outlined,
                        onTap: () {},
                      ), // Instagram
                      const SizedBox(
                        width: 14,
                      ),
                      _SocialIcon(
                        icon: Icons
                            .chat_bubble_outline,
                        onTap: () {},
                      ), // WhatsApp
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _InfoTile
    extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.all(
                  10,
                ),
            decoration: BoxDecoration(
              color: AppColor
                  .primaryColor
                  .withOpacity(0.08),
              borderRadius:
                  BorderRadius.circular(
                    10,
                  ),
            ),
            child: Icon(
              icon,
              color:
                  AppColor.primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors
                      .grey
                      .shade500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight:
                      FontWeight.w600,
                  color: AppColor
                      .primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialIcon
    extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:
          BorderRadius.circular(50),
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
