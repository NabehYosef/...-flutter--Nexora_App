import 'package:e_commerce/controller/App/myfavoritecontroller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';
import 'package:e_commerce/model/my_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems
    extends
        GetView<
          MyFavoriteControllerImp
        > {
  final FavoriteModel favoriteModel;
  const CustomListFavoriteItems({
    Key? key,
    required this.favoriteModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // بيانات المنتج قد تكون موجودة (لو الباك ايند يعمل populate) أو لأ
    final product =
        favoriteModel.product;

    String? imagePath =
        (product?.images != null &&
            product!.images!.isNotEmpty)
        ? product.images!.first
              .replaceAll("\\", "/")
        : null;

    String? fullImageUrl =
        imagePath != null
        ? "${AppLink.imagesBaseUrl}/$imagePath"
        : null;

    return InkWell(
      onTap: () {
        // لاحقاً: Get.toNamed(AppRoute.productdetails, arguments: {"productModel": product});
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment
                    .center,
            crossAxisAlignment:
                CrossAxisAlignment
                    .center,
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child:
                    fullImageUrl != null
                    ? Image.network(
                        fullImageUrl,
                        fit: BoxFit
                            .contain,
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
                                  color:
                                      Colors.grey,
                                ),
                              );
                            },
                      )
                    : Container(
                        color: AppColor
                            .grey2,
                        child: const Center(
                          child: Icon(
                            Icons
                                .image_not_supported,
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product?.productName ??
                    "منتج غير معروف",
                maxLines: 1,
                overflow: TextOverflow
                    .ellipsis,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${product?.averageRating ?? 0}",
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                children: [
                  Text(
                    "${product?.price ?? '-'} \$",
                    style: const TextStyle(
                      color: AppColor
                          .primaryColor,
                      fontSize: 16,
                      fontWeight:
                          FontWeight
                              .bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller
                          .deleteFromFavorite(
                            favoriteModel
                                .productId!,
                          );
                    },
                    icon: const Icon(
                      Icons
                          .delete_outline_outlined,
                      color: AppColor
                          .primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
