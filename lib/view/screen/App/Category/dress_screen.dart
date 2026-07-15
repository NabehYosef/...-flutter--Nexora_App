import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/view/screen/App/cart_screen.dart';
import 'package:e_commerce/view/widget/App/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DressScreen
    extends StatefulWidget {
  const DressScreen({super.key});

  @override
  State<DressScreen> createState() =>
      _DressScreenState();
}

class _DressScreenState
    extends State<DressScreen> {
  String selectedCategory = "dress";

  final List<Product> products = [
    Product(
      id: null,
      category: 'dress',
      name: 'Summer Floral Dress',
      description: 'Cotton • Size S-XL',
      image: 'assets/images/dress.webp',
      images: [],
      priceValue: 45,
      price: '\$45',
      stock: 25,
      colors: [],
      averageRating: 0,
      createdAt: null,
      updatedAt: null,
    ),
    Product(
      id: null,
      category: 'dress',
      name: 'Evening Elegant Dress',
      description: 'Silk • Size S-XL',
      image: 'assets/images/dress.webp',
      images: [],
      priceValue: 90,
      price: '\$90',
      stock: 10,
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
          'Dresses',
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
