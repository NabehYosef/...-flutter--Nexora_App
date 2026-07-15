import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/view/screen/App/cart_screen.dart';
import 'package:e_commerce/view/widget/App/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class WatchScreen
    extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() =>
      _WatchScreenState();
}

class _WatchScreenState
    extends State<WatchScreen> {
  String selectedCategory = "watch";

  final List<Product> products = [
    Product(
      id: null,
      category: 'watch',
      name: 'Apple Watch Series 9',
      description:
          '45mm • GPS • Aluminum Case',
      image: 'assets/images/watch.webp',
      images: [],
      priceValue: 400,
      price: '\$400',
      stock: 14,
      colors: [],
      averageRating: 0,
      createdAt: null,
      updatedAt: null,
    ),
    Product(
      id: null,
      category: 'watch',
      name: 'Samsung Galaxy Watch 6',
      description:
          '44mm • GPS • AMOLED Display',
      image: 'assets/images/watch.webp',
      images: [],
      priceValue: 320,
      price: '\$320',
      stock: 16,
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
          'Watches',
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
