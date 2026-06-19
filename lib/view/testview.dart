import 'package:e_commerce/controller/test_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        backgroundColor:
            AppColor.primarycolor,
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller
                .statusRequest,
            widget: ListView.builder(
              itemCount: controller
                  .data
                  .length,
              itemBuilder:
                  (context, index) {
                    return Text(
                      "${controller.data}",
                    );
                  },
            ),
          );
        },
      ),
    );
  }
}
