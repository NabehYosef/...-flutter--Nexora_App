import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CategorySection
    extends StatelessWidget {
  final List<Map<String, dynamic>>
  categories;
  final void Function(String name)?
  onCategoryTap;

  const CategorySection({
    super.key,
    required this.categories,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection:
                Axis.horizontal,
            itemCount:
                categories.length,
            separatorBuilder:
                (context, index) =>
                    const SizedBox(
                      width: 14,
                    ),
            itemBuilder: (context, index) {
              final cat =
                  categories[index];
              final name =
                  cat['name'] as String;
              return GestureDetector(
                onTap: () =>
                    onCategoryTap?.call(
                      name,
                    ),
                child: Column(
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      decoration: BoxDecoration(
                        color: AppColor
                            .categoryCard,
                        borderRadius:
                            BorderRadius.circular(
                              18,
                            ),
                      ),
                      child: Icon(
                        cat['icon']
                            as IconData,
                        size: 32,
                        color: AppColor
                            .primaryDark,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColor
                            .black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
