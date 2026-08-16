// import 'package:e_commerce/controller/address/adddetails_controller.dart';
// import 'package:e_commerce/core/class/handlingdataview.dart';
// import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
// import 'package:e_commerce/view/widget/auth/custombutton.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddressAddDetails extends StatelessWidget {
//   const AddressAddDetails({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AddAddressDetailsController controller =
//         Get.put(AddAddressDetailsController());
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('add details address'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(15),
//         child: GetBuilder<AddAddressDetailsController>(
//           builder: (controller) => HandlingDataView(
//             statusRequest: controller.statusRequest,
//             widget: ListView(
//               children: [
//                 CustomTextFormAuth(
//                   hinttext: "governorate",
//                   labeltext: "governorate",
//                   iconData: Icons.location_city,
//                   mycontroller: controller.governorateId,
//                   valid: (val) {
//                     if (val == null || val.isEmpty) {
//                       return "required";
//                     }
//                     return null;
//                   },
//                   isNumber: false,
//                 ),
//                 CustomTextFormAuth(
//                   hinttext: "location details",
//                   labeltext: "location details",
//                   iconData: Icons.streetview,
//                   mycontroller: controller.locationDetails,
//                   valid: (val) {
//                     if (val == null || val.isEmpty) {
//                       return "required";
//                     }
//                     return null;
//                   },
//                   isNumber: false,
//                 ),
//                 CustomButton(
//                   text: "Add",
//                   onPressed: () {
//                     controller.addAddress();
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
