import 'package:e_commerce/controller/App/favorite_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/App/favorite_page_header.dart';
import 'package:e_commerce/view/widget/App/favorite_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen
    extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      FavoriteController(),
    );

    return Scaffold(
      backgroundColor:
          AppColor.background,
      appBar: AppBar(
        backgroundColor:
            AppColor.primarycolor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColor.white,
        ),
        title: const Text(
          'Favourite',
          style: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const FavoritePageHeader(),
          Expanded(
            child: Obx(
              () =>
                  controller
                      .favoriteProducts
                      .isEmpty
                  ? const Center(
                      child: Text(
                        'No favourite items yet',
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              AppColor
                                  .grey,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding:
                          const EdgeInsets.all(
                            16,
                          ),
                      itemCount: controller
                          .favoriteProducts
                          .length,
                      separatorBuilder:
                          (
                            context,
                            index,
                          ) =>
                              const SizedBox(
                                height:
                                    14,
                              ),
                      itemBuilder: (context, index) {
                        final product =
                            controller
                                .favoriteProducts[index];
                        return FavoriteProductTile(
                          product:
                              product,
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
