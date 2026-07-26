import 'package:e_commerce/controller/App/productdetails_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails
    extends
        GetView<
          ProductDetailsControllerImp
        > {
  const TopProductPageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imagePath =
        (controller
                    .productModel
                    .images !=
                null &&
            controller
                .productModel
                .images!
                .isNotEmpty)
        ? controller
              .productModel
              .images!
              .first
              .replaceAll("\\", "/")
        : null;

    String? fullImageUrl =
        imagePath != null
        ? "${AppLink.imagesBaseUrl}/$imagePath"
        : null;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration:
              const BoxDecoration(
                color: AppColor
                    .secondColor,
              ),
        ),
        Positioned(
          top: 30.0,
          right: Get.width / 8,
          left: Get.width / 8,
          child: SizedBox(
            height: 250,
            child: fullImageUrl != null
                ? Image.network(
                    fullImageUrl,
                    fit: BoxFit.contain,
                    errorBuilder:
                        (
                          context,
                          error,
                          stackTrace,
                        ) {
                          return const Center(
                            child: Icon(
                              Icons
                                  .broken_image,
                              size: 60,
                            ),
                          );
                        },
                    loadingBuilder:
                        (
                          context,
                          child,
                          loadingProgress,
                        ) {
                          if (loadingProgress ==
                              null)
                            return child;
                          return const Center(
                            child:
                                CircularProgressIndicator(),
                          );
                        },
                  )
                : const Center(
                    child: Icon(
                      Icons
                          .image_not_supported,
                      size: 60,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
