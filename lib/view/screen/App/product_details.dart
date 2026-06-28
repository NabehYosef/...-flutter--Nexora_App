import 'package:e_commerce/controller/App/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_screen.dart';

class ProductDetailScreen
    extends StatefulWidget {
  final Map<String, dynamic>
  productData;

  const ProductDetailScreen({
    super.key,
    required this.productData,
  });

  @override
  State<ProductDetailScreen>
  createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {
  int quantity = 1;
  late double basePrice;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    // تحويل السعر لـ double والتأكد من عدم وجود null
    basePrice =
        (widget.productData['price'] ??
                0.0)
            .toDouble();
    totalPrice = basePrice;
  }

  void updateQuantity(bool isAdd) {
    setState(() {
      if (isAdd) {
        quantity++;
      } else if (quantity > 1) {
        quantity--;
      }
      totalPrice = basePrice * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productData['title'] ??
              "تفاصيل المنتج",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/photo_2026-05-12_00-57-49.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.productData['title'] ??
                  "",
              style: const TextStyle(
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
            Text(
              "\$${totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.productData['description'] ??
                  "وصف المنتج غير متوفر",
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove,
                  ),
                  onPressed: () =>
                      updateQuantity(
                        false,
                      ),
                ),
                Text(
                  "$quantity",
                  style:
                      const TextStyle(
                        fontSize: 20,
                      ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                  ),
                  onPressed: () =>
                      updateQuantity(
                        true,
                      ),
                ),
              ],
            ),
            const Spacer(), // هذه هي التي ستدفع الزر لآخر الشاشة
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.red,
                    ),
                onPressed: () {
                  // استخدام GetX للوصول للـ Controller والانتقال
                  final CartController
                  cart = Get.find();
                  cart.addToCart(
                    widget.productData,
                    quantity,
                  );
                  Get.to(
                    () =>
                        const CartScreen(),
                  );
                },
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
