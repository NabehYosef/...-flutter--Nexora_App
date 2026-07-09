import 'package:e_commerce/core/services/Apis/api_service.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeContentController
    extends GetxController {
  // Products are observable so UI updates when fetched from API
  final RxList<Product> products =
      <Product>[].obs;

  // Search query used to filter products in the UI
  final RxString searchQuery = ''.obs;

  // Categories loaded from backend
  final RxList<Map<String, dynamic>>
  categories =
      <Map<String, dynamic>>[].obs;

  // Loading and error state for the UI
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  // ApiService instance used for networking (ApiService provides a default token)
  final ApiService api = ApiService();
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
  }

  Future<void> fetchCategories() async {
    // Fetch categories from backend endpoint /api/product/categories (no auth required)
    isLoading.value = true;
    error.value = '';
    try {
      final items = await api
          .fetchCategories();

      if (items.isEmpty) {
        // fallback to default static categories if none returned
        categories.value = [
          {
            'name': 'laptop',
            'icon': Icons
                .laptop_mac_outlined,
          },
          {
            'name': 'camera',
            'icon': Icons
                .camera_alt_outlined,
          },
          {
            'name': 'mobile',
            'icon': Icons
                .smartphone_outlined,
          },
          {
            'name': 'shoes',
            'icon': Icons
                .directions_walk_outlined,
          },
          {
            'name': 'dress',
            'icon': Icons
                .checkroom_outlined,
          },
          {
            'name': 'watch',
            'icon':
                Icons.watch_outlined,
          },
        ];
      } else {
        // Map backend categories to simple {name, icon}
        categories.value = items
            .map<Map<String, dynamic>>((
              e,
            ) {
              final name =
                  (e is Map &&
                      e['categoryName'] !=
                          null)
                  ? e['categoryName']
                        .toString()
                  : (e is Map &&
                            e['name'] !=
                                null
                        ? e['name']
                              .toString()
                        : e.toString());
              return {
                'name': name,
                'icon': Icons.category,
              };
            })
            .toList();
      }
    } catch (err) {
      // keep existing static categories on error
      categories.value = [
        {
          'name': 'laptop',
          'icon':
              Icons.laptop_mac_outlined,
        },
        {
          'name': 'camera',
          'icon':
              Icons.camera_alt_outlined,
        },
        {
          'name': 'mobile',
          'icon':
              Icons.smartphone_outlined,
        },
        {
          'name': 'shoes',
          'icon': Icons
              .directions_walk_outlined,
        },
        {
          'name': 'dress',
          'icon':
              Icons.checkroom_outlined,
        },
        {
          'name': 'watch',
          'icon': Icons.watch_outlined,
        },
      ];
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    error.value = '';
    try {
      final items = await api
          .fetchProducts(
            page: 1,
            limit: 1000,
          );

      products.value = items;
      if (items.isEmpty) {
        error.value =
            'لا توجد منتجات متاحة حاليًا';
      }
    } catch (err) {
      error.value =
          'حدث خطأ أثناء تحميل المنتجات: $err';
      products.clear();
    } finally {
      isLoading.value = false;
    }
  }

  // Update the current search query used by UI. Use this from text fields.
  void updateSearch(String q) {
    searchQuery.value = q.trim();
  }

  // Returns the products filtered by the current searchQuery.
  // Filters by name, description and category (case-insensitive).
  List<Product> get filteredProducts {
    final q = searchQuery.value
        .toLowerCase();
    if (q.isEmpty)
      return products.toList();

    return products.where((p) {
      final name = p.name.toLowerCase();
      final desc = p.description
          .toLowerCase();
      final cat = (p.category ?? '')
          .toLowerCase();
      return desc.contains(q);
    }).toList();
  }
}
