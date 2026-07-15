import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/view/screen/App/cart_screen.dart';
import 'package:e_commerce/view/widget/App/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CameraScreen
    extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() =>
      _CameraScreenState();
}

class _CameraScreenState
    extends State<CameraScreen> {
  String selectedCategory = "camera";

  final List<Product> products = [
    Product(
      id: null,
      category: 'camera',
      name: 'Canon EOS R6',
      description:
          'Mirrorless • 20MP • 4K Video',
      image:
          'assets/images/camera.webp',
      images: [],
      priceValue: 2500,
      price: '\$2500',
      stock: 6,
      colors: [],
      averageRating: 0,
      createdAt: null,
      updatedAt: null,
    ),
    Product(
      id: null,
      category: 'camera',
      name: 'Sony Alpha A7 III',
      description:
          'Full Frame • 24MP • 4K Video',
      image:
          'assets/images/camera.webp',
      images: [],
      priceValue: 2000,
      price: '\$2000',
      stock: 5,
      colors: [],
      averageRating: 0,
      createdAt: null,
      updatedAt: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.deepOrange,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor:
            Colors.deepOrange,
        title: const Text(
          'Cameras',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.all(
                      12,
                    ),
                itemCount:
                    products.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 200,
                    child: InkWell(
                      onTap: () {
                        Get.to(
                          CartScreen(),
                        );
                      },
                      child: ProductCard(
                        product:
                            products[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
