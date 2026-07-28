import 'package:e_commerce/controller/App/itemes_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems
    extends
        GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key})
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
    extends
        GetView<ItemsControllerImp> {
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
        controller.changeCat(i!);
      },
      child: Column(
        children: [
          GetBuilder<
            ItemsControllerImp
          >(
            builder: (controller) => Container(
              padding:
                  const EdgeInsets.only(
                    right: 10,
                    left: 10,
                    bottom: 5,
                  ),
              decoration:
                  controller
                          .selectedCat ==
                      i
                  ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 3,
                          color: AppColor
                              .primaryColor,
                        ),
                      ),
                    )
                  : null,
              child: Text(
                "${categoriesModel.categoryName}",
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColor.grey2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
