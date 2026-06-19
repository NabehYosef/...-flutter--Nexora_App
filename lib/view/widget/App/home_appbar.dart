import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onFavoriteTap;
  final ValueChanged<String>? onSearch;

  const HomeAppBar({
    super.key,
    this.onFavoriteTap,
    this.onSearch,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          AppColor.background,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color:
                        AppColor.white,
                    borderRadius:
                        BorderRadius.circular(
                          14,
                        ),
                  ),
                  child: TextField(
                    onChanged: onSearch,
                    decoration: const InputDecoration(
                      hintText:
                          'Find Product',
                      hintStyle:
                          TextStyle(
                            color:
                                AppColor
                                    .grey,
                            fontSize:
                                15,
                          ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColor
                            .grey,
                      ),
                      border:
                          InputBorder
                              .none,
                      contentPadding:
                          EdgeInsets.symmetric(
                            vertical:
                                14,
                          ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onFavoriteTap,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color:
                        AppColor.white,
                    borderRadius:
                        BorderRadius.circular(
                          14,
                        ),
                  ),
                  child: const Icon(
                    Icons
                        .favorite_border,
                    color:
                        AppColor.grey,
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
