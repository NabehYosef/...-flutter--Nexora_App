import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';

class ProductCard
    extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          _buildImage(product.image),
          Positioned(
            left: 12,
            bottom: 12,
            right: 12,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style:
                        const TextStyle(
                          color: Colors
                              .white,
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                    maxLines: 1,
                    overflow:
                        TextOverflow
                            .ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  product.price,
                  style:
                      const TextStyle(
                        color: Colors
                            .white,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String imgStr) {
    if (imgStr.startsWith('http')) {
      return Image.network(
        imgStr,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, __, ___) =>
            Container(
              color:
                  AppColor.productCard,
            ),
      );
    }
    return Image.asset(
      imgStr,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
