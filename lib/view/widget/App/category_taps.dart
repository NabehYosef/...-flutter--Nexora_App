import 'package:flutter/material.dart';

class CategoryTabs
    extends StatelessWidget {
  final String selected;
  final Function(String) onSelect;

  CategoryTabs({
    required this.selected,
    required this.onSelect,
  });

  final List<String> categories = [
    "laptop",
    "camera",
    "mobile",
    "shoes",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection:
            Axis.horizontal,
        padding:
            const EdgeInsets.symmetric(
              horizontal: 12,
            ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected =
              cat == selected;

          return GestureDetector(
            onTap: () => onSelect(cat),
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 250,
              ),
              margin:
                  const EdgeInsets.symmetric(
                    horizontal: 6,
                  ),
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.deepOrange
                    : Colors.white,
                borderRadius:
                    BorderRadius.circular(
                      30,
                    ),
                boxShadow: const [
                  BoxShadow(
                    color:
                        Colors.black12,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  cat,
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    color: isSelected
                        ? Colors.white
                        : Colors
                              .black87,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
