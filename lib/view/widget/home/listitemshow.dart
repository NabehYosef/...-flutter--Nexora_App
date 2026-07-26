import 'package:e_commerce/controller/App/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';
import 'package:e_commerce/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome
    extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount:
            controller.products.length,
        scrollDirection:
            Axis.horizontal,
        itemBuilder: (context, i) {
          return ItemsHome(
            productModel:
                controller.products[i],
          );
        },
      ),
    );
  }
}

class ItemsHome
    extends StatelessWidget {
  final ProductModel productModel;
  const ItemsHome({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imagePath =
        (productModel.images != null &&
            productModel
                .images!
                .isNotEmpty)
        ? productModel.images!.first
              .replaceAll("\\", "/")
        : null;

    String? fullImageUrl =
        imagePath != null
        ? "${AppLink.imagesBaseUrl}/$imagePath"
        : null;

    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoute.productdetails,
          arguments: {
            "productModel":
                productModel,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: 10,
        ),
        height: 120,
        width: 200,
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: AppColor.grey2,
              ),
              if (fullImageUrl != null)
                Image.network(
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
                            color: Colors
                                .grey,
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
                          child: CircularProgressIndicator(
                            strokeWidth:
                                2,
                          ),
                        );
                      },
                )
              else
                const Center(
                  child: Icon(
                    Icons
                        .image_not_supported,
                    color: Colors.grey,
                  ),
                ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment
                          .bottomCenter,
                      end: Alignment
                          .topCenter,
                      colors: [
                        AppColor.black
                            .withOpacity(
                              0.6,
                            ),
                        AppColor.black
                            .withOpacity(
                              0.0,
                            ),
                      ],
                    ),
                  ),
                  child: Text(
                    "${productModel.productName}",
                    maxLines: 1,
                    overflow:
                        TextOverflow
                            .ellipsis,
                    style:
                        const TextStyle(
                          color: Colors
                              .white,
                          fontSize: 14,
                          fontWeight:
                              FontWeight
                                  .w500,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
