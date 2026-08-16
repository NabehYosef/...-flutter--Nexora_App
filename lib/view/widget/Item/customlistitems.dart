// import 'package:e_commerce/controller/App/favorite_controller.dart';
// import 'package:e_commerce/controller/App/items_controller.dart';
// import 'package:e_commerce/core/constant/color.dart';
// import 'package:e_commerce/core/constant/routes.dart';
// import 'package:e_commerce/core/services/Apis/linkapi.dart';
// import 'package:e_commerce/model/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomListItems extends GetView<ItemsControllerImp> {
//   final ProductModel productModel;
//   const CustomListItems({Key? key, required this.productModel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String? imagePath = (productModel.images != null &&
//             productModel.images!.isNotEmpty)
//         ? productModel.images!.first.replaceAll("\\", "/")
//         : null;

//     String? fullImageUrl =
//         imagePath != null ? "${AppLink.imagesBaseUrl}/$imagePath" : null;

//     final bool hasDiscount =
//         productModel.discount != null && productModel.discount! > 0;

//     // السعر بعد الخصم (لو فيه خصم)
//     final num finalPrice = hasDiscount
//         ? (productModel.price ?? 0) -
//             ((productModel.price ?? 0) * (productModel.discount! / 100))
//         : (productModel.price ?? 0);

//     return InkWell(
//       onTap: () {
//         Get.toNamed(
//           AppRoute.productdetails,
//           arguments: {"productModel": productModel},
//         );
//       },
//       child: Card(
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 100,
//                     width: double.infinity,
//                     child: fullImageUrl != null
//                         ? Image.network(
//                             fullImageUrl,
//                             fit: BoxFit.contain,
//                             errorBuilder: (context, error, stackTrace) {
//                               return const Center(
//                                 child: Icon(Icons.broken_image,
//                                     color: Colors.grey),
//                               );
//                             },
//                           )
//                         : Container(
//                             color: AppColor.grey2,
//                             child: const Center(
//                               child: Icon(Icons.image_not_supported),
//                             ),
//                           ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     productModel.productName ?? "",
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       color: AppColor.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Rating ${productModel.averageRating ?? 0}",
//                         textAlign: TextAlign.center,
//                       ),
//                       const Icon(Icons.star, size: 15, color: Colors.amber),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // نعرض السعر بعد الخصم، ومع خط فوق السعر الأصلي لو فيه خصم
//                       Row(
//                         children: [
//                           Text(
//                             "$finalPrice \$",
//                             style: const TextStyle(
//                               color: AppColor.primaryColor,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           if (hasDiscount) ...[
//                             const SizedBox(width: 5),
//                             Text(
//                               "${productModel.price} \$",
//                               style: const TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 12,
//                                 decoration: TextDecoration.lineThrough,
//                               ),
//                             ),
//                           ],
//                         ],
//                       ),
//                       GetBuilder<FavoriteControllerImp>(
//                         builder: (favController) => IconButton(
//                           onPressed: () {
//                             bool isFav =
//                                 favController.isFavorite[productModel.id] ??
//                                     false;
//                             if (isFav) {
//                               favController.removeFavorite(productModel.id!);
//                             } else {
//                               favController.addFavorite(productModel.id!);
//                             }
//                           },
//                           icon: Icon(
//                             (favController.isFavorite[productModel.id] ??
//                                     false)
//                                 ? Icons.favorite
//                                 : Icons.favorite_border_outlined,
//                             color: AppColor.primaryColor,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             // شارة الخصم — تظهر فقط لو فيه خصم فعلي
//             if (hasDiscount)
//               Positioned(
//                 top: 4,
//                 left: 4,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 6,
//                     vertical: 3,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: Text(
//                     "-${productModel.discount}%",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
