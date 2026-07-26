import 'package:e_commerce/controller/App/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/services/Apis/linkapi.dart';
import 'package:e_commerce/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome
    extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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
            //  child: SvgPicture.network(
            //   "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
            //   color: AppColor.secondColor),
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
