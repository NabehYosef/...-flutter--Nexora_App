import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/view/screen/App/cart_screen.dart';
import 'package:e_commerce/view/widget/App/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MobileScreen
    extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() =>
      _MobileScreenState();
}

class _MobileScreenState
    extends State<MobileScreen> {
  String selectedCategory = "mobile";

  final List<Product> products = [
    Product(
      id: null,
      category: 'mobile',
      name: 'iPhone 15 Pro',
      description:
          '256GB • Titanium • A17 Pro',
      image:
          'assets/images/mobile.webp',
      images: [],
      priceValue: 1100,
      price: '\$1100',
      stock: 15,
      colors: [],
      averageRating: 0,
      createdAt: null,
      updatedAt: null,
    ),
    Product(
      id: null,
      category: 'mobile',
      name: 'Samsung Galaxy S24',
      description:
          '256GB • Snapdragon 8 Gen 3',
      image:
          'assets/images/iphone.webp',
      images: [],
      priceValue: 950,
      price: '\$950',
      stock: 12,
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
          'Mobiles',
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
