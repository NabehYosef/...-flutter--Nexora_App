import 'package:e_commerce/controller/App/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome
    extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        separatorBuilder:
            (context, index) =>
                const SizedBox(
                  width: 10,
                ),
        itemCount: controller
            .categories
            .length,
        scrollDirection:
            Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel: controller
                .categories[index],
          );
        },
      ),
    );
  }
}

class Categories
    extends GetView<HomeControllerImp> {
  final CategoryModel categoriesModel;
  final int? i;
  const Categories({
    Key? key,
    required this.categoriesModel,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? fullImageUrl;
    if (categoriesModel.image != null &&
        categoriesModel
            .image!
            .isNotEmpty) {
      String cleanPath = categoriesModel
          .image!
          .replaceAll("\\", "/");
      fullImageUrl =
          "${AppLink.imagesBaseUrl}/images/$cleanPath";
    }

    return InkWell(
      onTap: () {
        controller.goToItems(
          controller.categories,
          i!,
        );
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  AppColor.thirdColor,
              borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
            ),
            height: 70,
            width: 70,
            child: fullImageUrl != null
                ? ClipRRect(
                    borderRadius:
                        BorderRadius.circular(
                          20,
                        ),
                    child: Image.network(
                      fullImageUrl,
                      fit: BoxFit.cover,
                      height: 70,
                      width: 70,
                      errorBuilder:
                          (
                            context,
                            error,
                            stackTrace,
                          ) {
                            return const Icon(
                              Icons
                                  .category_outlined,
                            );
                          },
                    ),
                  )
                : const Icon(
                    Icons
                        .category_outlined,
                  ),
          ),
          const SizedBox(height: 5),
          Text(
            "${categoriesModel.categoryName}",
            style: const TextStyle(
              fontSize: 13,
              color: AppColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
