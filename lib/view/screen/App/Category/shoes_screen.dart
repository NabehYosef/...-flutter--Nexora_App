import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/view/screen/App/cart_screen.dart';
import 'package:e_commerce/view/widget/App/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ShoesScreen
    extends StatefulWidget {
  const ShoesScreen({super.key});

  @override
  State<ShoesScreen> createState() =>
      _ShoesScreenState();
}

class _ShoesScreenState
    extends State<ShoesScreen> {
  String selectedCategory = "shoes";

  final List<Product> products = [
    Product(
      id: null,
      category: 'shoes',
      name: 'Nike Air Max',
      description:
          'Running Shoes • Size 40-45',
      image: 'assets/images/shoes.webp',
      images: [],
      priceValue: 120,
      price: '\$120',
      stock: 20,
      colors: [],
      averageRating: 0,
      createdAt: null,
      updatedAt: null,
    ),
    Product(
      id: null,
      category: 'shoes',
      name: 'Adidas Ultraboost',
      description:
          'Sport Shoes • Size 39-44',
      image: 'assets/images/shoes.webp',
      images: [],
      priceValue: 150,
      price: '\$150',
      stock: 18,
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
          'Shoes',
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
