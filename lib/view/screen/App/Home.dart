import 'package:e_commerce/controller/App/home_content_controller.dart';
import 'package:e_commerce/controller/App/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/screen/App/favorite_screen.dart';
import 'package:e_commerce/view/screen/App/Category/laptop_screen.dart';
import 'package:e_commerce/view/screen/App/Category/camera_screen.dart';
import 'package:e_commerce/view/screen/App/Category/mobile_screen.dart';
import 'package:e_commerce/view/screen/App/Category/shoes_screen.dart';
import 'package:e_commerce/view/screen/App/Category/dress_screen.dart';
import 'package:e_commerce/view/screen/App/Category/watch_screen.dart';
import 'package:e_commerce/view/screen/App/setting_screen.dart';
import 'package:e_commerce/view/widget/App/ads_banner.dart';
import 'package:e_commerce/view/widget/App/category_section.dart';
import 'package:e_commerce/view/widget/App/custom_button.dart';
import 'package:e_commerce/view/widget/App/home_appBar.dart';
import 'package:e_commerce/view/widget/App/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen
    extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      HomeController(),
    );
    final contentController = Get.put(
      HomeContentController(),
    );

    return Obx(
      () => Scaffold(
        backgroundColor:
            AppColor.background,
        appBar:
            controller
                    .currentIndex
                    .value ==
                0
            ? HomeAppBar(
                onFavoriteTap: () => Get.to(
                  () =>
                      const FavoriteScreen(),
                ),
                onSearch:
                    contentController
                        .updateSearch,
              )
            : null,
        body: _buildPage(
          controller,
          contentController,
        ),
        bottomNavigationBar:
            const CustomBottomNav(),
      ),
    );
  }

  void _navigateToCategory(
    String name,
  ) {
    final n = name.trim().toLowerCase();

    if (n.contains('laptop')) {
      Get.to(
        () => const LaptopScreen(),
      );
    } else if (n.contains('camera')) {
      Get.to(
        () => const CameraScreen(),
      );
    } else if (n.contains('mobile') ||
        n.contains('phone')) {
      Get.to(
        () => const MobileScreen(),
      );
    } else if (n.contains('shoe')) {
      Get.to(() => const ShoesScreen());
    } else if (n.contains('dress')) {
      Get.to(() => const DressScreen());
    } else if (n.contains('watch')) {
      Get.to(() => const WatchScreen());
    } else {
      Get.snackbar(
        'Category',
        'No screen mapped for "$name" yet',
      );
    }
  }

  Widget _buildPage(
    HomeController controller,
    HomeContentController
    contentController,
  ) {
    switch (controller
        .currentIndex
        .value) {
      case 4:
        return const SettingsScreen();
      case 1:
      case 2:
      case 3:
        return const Center(
          child: Text(
            'Coming soon',
            style: TextStyle(
              fontSize: 18,
              fontWeight:
                  FontWeight.w600,
              color: AppColor.black,
            ),
          ),
        );
      case 0:
      default:
        return SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(
                horizontal: 16,
              ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,
            children: [
              const SizedBox(
                height: 16,
              ),
              const AdsBanner(),
              const SizedBox(
                height: 24,
              ),
              Obx(
                () => CategorySection(
                  categories:
                      contentController
                          .categories
                          .toList(),
                  onCategoryTap:
                      _navigateToCategory,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Product for you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Obx(() {
                if (contentController
                    .isLoading
                    .value) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child:
                          CircularProgressIndicator(),
                    ),
                  );
                }

                if (contentController
                    .error
                    .value
                    .isNotEmpty) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisSize:
                            MainAxisSize
                                .min,
                        children: [
                          Text(
                            contentController
                                .error
                                .value,
                            textAlign:
                                TextAlign
                                    .center,
                            style: const TextStyle(
                              color: AppColor
                                  .black,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                            onPressed: () =>
                                contentController
                                    .fetchProducts(),
                            child:
                                const Text(
                                  'Retry',
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                final filtered =
                    contentController
                        .filteredProducts;

                if (filtered.isEmpty) {
                  return const SizedBox(
                    height: 120,
                    child: Center(
                      child: Text(
                        'No products found',
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            2,
                        crossAxisSpacing:
                            14,
                        mainAxisSpacing:
                            14,
                        childAspectRatio:
                            1.0,
                      ),
                  itemCount:
                      filtered.length,
                  itemBuilder:
                      (context, index) {
                        return ProductCard(
                          product:
                              filtered[index],
                        );
                      },
                );
              }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
    }
  }
}
