import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class AdsBanner
    extends StatelessWidget {
  const AdsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: AppColor.primarycolor,
        borderRadius:
            BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: AppColor
                    .primaryDark,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.all(
                  24,
                ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
              mainAxisAlignment:
                  MainAxisAlignment
                      .center,
              children: const [
                Text(
                  'A summer surprise',
                  style: TextStyle(
                    color:
                        Colors.white70,
                    fontSize: 15,
                    fontWeight:
                        FontWeight.w400,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Cashback 20%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
