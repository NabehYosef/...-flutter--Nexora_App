import 'package:e_commerce/controller/App/productdetails_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubitemsList
    extends
        GetView<
          ProductDetailsControllerImp
        > {
  const SubitemsList({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => InkWell(
            onTap: () {
              controller.selectColor(
                index,
              );
            },
            child: Container(
              alignment:
                  Alignment.center,
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
              height: 45,
              constraints:
                  const BoxConstraints(
                    minWidth: 70,
                  ),
              decoration: BoxDecoration(
                color:
                    controller
                            .subitems[index]['active'] ==
                        "1"
                    ? AppColor
                          .fourthColor
                    : Colors.white,
                border: Border.all(
                  color: AppColor
                      .fourthColor,
                ),
                borderRadius:
                    BorderRadius.circular(
                      10,
                    ),
              ),
              child: Text(
                controller
                    .subitems[index]['name'],
                style: TextStyle(
                  color:
                      controller
                              .subitems[index]['active'] ==
                          "1"
                      ? Colors.white
                      : AppColor
                            .fourthColor,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
