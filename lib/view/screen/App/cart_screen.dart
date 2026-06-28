import 'package:e_commerce/controller/App/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen
    extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController =
        Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "سلة المشتريات",
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            // شريط عدد العناصر
            Padding(
              padding:
                  const EdgeInsets.all(
                    15.0,
                  ),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(
                      12,
                    ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.circular(
                        10,
                      ),
                ),
                child: Text(
                  "You Have ${cartController.cartItems.length} Item(s) in Your List",
                  style:
                      const TextStyle(
                        color: Colors
                            .white,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                  textAlign:
                      TextAlign.center,
                ),
              ),
            ),

            // قائمة المنتجات
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                itemCount:
                    cartController
                        .cartItems
                        .length,
                itemBuilder: (context, index) {
                  final item =
                      cartController
                          .cartItems[index];
                  return _buildProductCard(
                    item,
                    cartController,
                  );
                },
              ),
            ),

            // القسم السفلي (الكوبون + السعر + زر الطلب)
            Container(
              padding:
                  const EdgeInsets.all(
                    20,
                  ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(
                      top:
                          Radius.circular(
                            30,
                          ),
                    ),
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildCouponSection(),
                  const SizedBox(
                    height: 15,
                  ),
                  _priceRow(
                    "Price",
                    "${cartController.totalPrice.value.toStringAsFixed(2)}\$",
                  ),
                  _priceRow(
                    "Discount",
                    "0%",
                  ),
                  _priceRow(
                    "Shipping",
                    "0.0\$",
                  ),
                  const Divider(
                    height: 25,
                    thickness: 1.5,
                  ),
                  _priceRow(
                    "Total Price",
                    "${cartController.totalPrice.value.toStringAsFixed(2)}\$",
                    isBold: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width:
                        double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red,
                        shape:
                            const StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Place Order",
                        style: TextStyle(
                          color: Colors
                              .white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    dynamic item,
    CartController cart,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(
                  15,
                ),
            child: Image.asset(
              'assets/images/photo_2026-05-12_00-57-49.jpg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
              children: [
                Text(
                  item['title'] ??
                      "منتج",
                  style:
                      const TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                        fontSize: 16,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                  decoration: BoxDecoration(
                    color: Colors.blue
                        .withOpacity(
                          0.1,
                        ),
                    borderRadius:
                        BorderRadius.circular(
                          8,
                        ),
                  ),
                  child: Text(
                    "${item['price']}\$",
                    style:
                        const TextStyle(
                          color: Colors
                              .red,
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => cart
                .removeItem(item['id']),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
    String label,
    String value, {
    bool isBold = false,
  }) => Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 5,
    ),
    child: Row(
      mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 18 : 15,
            fontWeight: isBold
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 18 : 15,
            fontWeight: isBold
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ],
    ),
  );

  Widget _buildCouponSection() => Row(
    children: [
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: "أدخل الكود",
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                    15,
                  ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        onPressed: () {},
        child: const Text("apply"),
      ),
    ],
  );
}
