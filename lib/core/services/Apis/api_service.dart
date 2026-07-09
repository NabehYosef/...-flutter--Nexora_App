import 'dart:convert';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';
import 'package:flutter/foundation.dart'
    show
        kIsWeb,
        defaultTargetPlatform,
        TargetPlatform;
import 'package:http/http.dart' as http;

class ApiService {
  static ApiService? shared;
  static const Duration _probeTimeout =
      Duration(seconds: 4);

  ApiService() {
    shared ??= this;
  }

  Future<http.Response?> _tryGet(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    try {
      return await http
          .get(uri, headers: headers)
          .timeout(_probeTimeout);
    } catch (_) {
      return null;
    }
  }

  String _detectApiHost() {
    if (kIsWeb) return 'localhost:5000';
    if (defaultTargetPlatform ==
        TargetPlatform.android) {
      return '10.0.2.2:5000';
    }
    return 'localhost:5000';
  }

  List<String> _candidateHosts() {
    if (kIsWeb)
      return ['localhost:5000'];
    if (defaultTargetPlatform ==
        TargetPlatform.android) {
      return [
        '127.0.0.1:5000',
        'localhost:5000',
        '10.0.2.2:5000',
      ];
    }
    return ['localhost:5000'];
  }

  /// يجيب أحدث توكن محفوظ فعليًا من التخزين قبل كل طلب.
  Future<Map<String, String>>
  _authHeaders() async {
    final token =
        await TokenStorage.getToken();
    return {
      'Authorization': 'Bearer $token',
      'token': token,
      'Accept': 'application/json',
      'Content-Type':
          'application/json',
    };
  }

  Future<List<dynamic>>
  fetchCategories() async {
    final hosts = _candidateHosts();
    List<dynamic> items = [];

    for (final host in hosts) {
      try {
        final uri = Uri.parse(
          'http://$host/api/product/categories',
        );
        final res = await _tryGet(uri);
        if (res != null &&
            res.statusCode == 200) {
          final body = json.decode(
            res.body,
          );
          if (body is List &&
              body.isNotEmpty) {
            items = body;
            break;
          } else if (body is Map &&
              body['data'] != null) {
            items = body['data'];
            break;
          }
        }
      } catch (_) {
        // try next host
      }
    }

    return items;
  }

  Future<List<Product>> fetchProducts({
    int page = 1,
    int limit = 1000,
  }) async {
    final hosts = _candidateHosts();
    List<dynamic> items = [];
    final headers =
        await _authHeaders(); // ⬅️ توكن طازة من TokenStorage

    for (final host in hosts) {
      try {
        final uri = Uri.parse(
          'http://$host/api/product/products?page=$page&limit=$limit',
        );
        final res = await _tryGet(
          uri,
          headers: headers,
        );

        print(
          'HOST: $host  STATUS: ${res?.statusCode}  BODY: ${res?.body}',
        );

        if (res != null &&
            res.statusCode == 200) {
          final body = json.decode(
            res.body,
          );
          if (body is List) {
            items = body;
            break;
          } else if (body is Map &&
              body['data'] != null) {
            items = body['data'];
            break;
          } else if (body is Map &&
              body['products'] !=
                  null) {
            items = body['products'];
            break;
          } else if (body is Map &&
              body['result'] != null) {
            items = body['result'];
            break;
          } else if (body is Map &&
              body['docs'] != null) {
            items = body['docs'];
            break;
          }
        }
      } catch (_) {
        // try next host
      }
    }

    final List<Product> products = items
        .map<Product>((e) {
          return Product.fromMap(
            e as Map<String, dynamic>,
            _normalizeImagePath,
          );
        })
        .toList();

    return products;
  }

  Future<List<Product>> filterProducts({
    String? category,
    String? name,
    int page = 1,
    int limit = 1000,
    int? minPrice,
    int? maxPrice,
  }) async {
    final hosts = _candidateHosts();
    List<dynamic> items = [];
    final headers =
        await _authHeaders(); // ⬅️ توكن طازة من TokenStorage

    final Map<String, String> q = {};
    if (category != null &&
        category.isNotEmpty)
      q['category'] = category;
    if (name != null && name.isNotEmpty)
      q['name'] = name;
    if (minPrice != null)
      q['minPrice'] = minPrice
          .toString();
    if (maxPrice != null)
      q['maxPrice'] = maxPrice
          .toString();
    q['page'] = page.toString();
    q['limit'] = limit.toString();

    for (final host in hosts) {
      try {
        final qs = q.entries
            .map(
              (e) =>
                  '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}',
            )
            .join('&');
        final uri = Uri.parse(
          'http://$host/api/product/filter${qs.isNotEmpty ? '?$qs' : ''}',
        );
        final res = await _tryGet(
          uri,
          headers: headers,
        );
        if (res != null &&
            res.statusCode == 200) {
          final body = json.decode(
            res.body,
          );
          if (body is List) {
            items = body;
            break;
          } else if (body is Map &&
              body['data'] != null) {
            items = body['data'];
            break;
          } else if (body is Map &&
              body['products'] !=
                  null) {
            items = body['products'];
            break;
          } else if (body is Map &&
              body['result'] != null) {
            items = body['result'];
            break;
          } else if (body is Map &&
              body['docs'] != null) {
            items = body['docs'];
            break;
          }
        }
      } catch (_) {
        // try next host
      }
    }

    final List<Product> products = items
        .map<Product>((e) {
          return Product.fromMap(
            e as Map<String, dynamic>,
            _normalizeImagePath,
          );
        })
        .toList();

    return products;
  }

  Future<bool> addToFavourite(
    String productId,
  ) async {
    if (productId.isEmpty) return false;

    final headers =
        await _authHeaders(); // ⬅️ توكن طازة من TokenStorage

    for (final host
        in _candidateHosts()) {
      try {
        final uri = Uri.parse(
          'http://$host/api/list/addToFavourite/$productId',
        );
        final res = await http
            .post(uri, headers: headers)
            .timeout(_probeTimeout);
        if (res.statusCode == 201 ||
            res.statusCode == 200)
          return true;
        return false;
      } catch (_) {
        // try next host
      }
    }

    return false;
  }

  String _normalizeImagePath(
    dynamic raw,
  ) {
    if (raw == null)
      return 'assets/images/laptop.jpg';
    final s = raw.toString().trim();
    if (s.isEmpty)
      return 'assets/images/laptop.jpg';

    if (s.startsWith('http://') ||
        s.startsWith('https://')) {
      return s.replaceAll('\\', '/');
    }

    var path = s.replaceAll('\\', '/');
    if (path.startsWith('assets/'))
      return path;
    if (path.startsWith('images/'))
      return 'assets/$path';
    if (path.contains('images/')) {
      return 'assets/${path.substring(path.indexOf('images/'))}';
    }

    if (path.startsWith('uploads/') ||
        path.startsWith('files/') ||
        path.contains('/')) {
      return apiHostForPath(path);
    }

    if (!path.contains('/'))
      return 'assets/images/$path';
    return 'assets/$path';
  }

  String apiHostForPath(String path) {
    final host = _detectApiHost();
    final clean = path.startsWith('/')
        ? path.substring(1)
        : path;
    return 'http://$host/$clean';
  }
}
