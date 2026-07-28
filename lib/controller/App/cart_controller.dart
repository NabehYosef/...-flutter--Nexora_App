
// import 'package:e_commerce/core/class/statusrequest.dart';
// import 'package:e_commerce/core/functions/handlingdatacontroller.dart';
// import 'package:e_commerce/core/services/services.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CartController extends GetxController {
//   CartData cartData = CartData(Get.find());

//   late StatusRequest statusRequest;

//   MyServices myServices = Get.find();

//   List<CartModel> data = [];

//   double priceorders = 0.0;

//   int totalcountitems = 0;

//   add(String itemsid) async {
//     statusRequest = Statusrequest.loading;
//     update();
//     var response = await cartData.addCart(
//         myServices.sharedPreferences.getString("id")!, itemsid);
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (Statusrequest.success == statusRequest) {
//       // Start backend
//       if (response['status'] == "success") {
//         Get.rawSnackbar(
//             title: "اشعار",
//             messageText: const Text("تم اضافة المنتج الى السلة "));
//         // data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//       // End
//     }
//     update();
//   }

//   delete(String itemsid) async {
//     statusRequest = StatusRequest.loading;
//     update();

//     var response = await cartData.deleteCart(
//         myServices.sharedPreferences.getString("id")!, itemsid);
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       // Start backend
//       if (response['status'] == "success") {
//         Get.rawSnackbar(
//             title: "اشعار",
//             messageText: const Text("تم ازالة المنتج من السلة "));
//         // data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//       // End
//     }
//     update();
//   }

 

//   resetVarCart() {
//     totalcountitems = 0;
//     priceorders = 0.0;
//     data.clear();
//   }

//   refreshPage() {
//     resetVarCart();
//     view();
//   }

//   view() async {
//     statusRequest = Statusrequest.loading;
//     update();
//     var response =
//         await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (Statusrequest.success == statusRequest) {
//       // Start backend
//       if (response['status'] == "success") {
//         if (response['datacart']['status'] == 'success') {
//           List dataresponse = response['datacart']['data'];
//           Map dataresponsecountprice = response['countprice'];
//           data.clear();
//       //    data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
//           totalcountitems = int.parse(dataresponsecountprice['totalcount']);
//           priceorders = double.parse(dataresponsecountprice['totalprice']);
//           print(priceorders);
//         }
//       } else {
//         statusRequest = Statusrequest.failure;
//       }
//       // End
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     view();
//     super.onInit();
//   }
// }