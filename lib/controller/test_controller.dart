import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
import 'package:e_commerce/data/datasource/static/remote/test_Data.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TestController
    extends GetxController {
  TestData testData = TestData(
    Get.find(),
  );

  // TestController(this.testData);

  List data = [];

  late Statusrequest statusRequest;

  getData() async {
    statusRequest =
        Statusrequest.loading;

    var response = await testData
        .getData();
    print(response);

    statusRequest = handlingData(
      response,
    );

    if (Statusrequest.success ==
        statusRequest) {
      data.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
