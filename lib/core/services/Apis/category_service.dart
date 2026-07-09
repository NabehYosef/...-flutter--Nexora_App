import 'package:e_commerce/core/network/api_client.dart';
import 'package:e_commerce/core/network/end_pointe.dart';

class CategoryService {
  final ApiClient _apiClient;

  CategoryService({
    ApiClient? apiClient,
  }) : _apiClient =
           apiClient ?? ApiClient();

  Future<List<dynamic>>
  fetchCategories() async {
    final res = await _apiClient.get(
      Endpoints.categories,
      includeAuth: false,
    );
    if (res == null ||
        res.statusCode != 200)
      return [];

    final body = ApiClient.decodeBody(
      res.body,
    );
    if (body is List) return body;
    if (body is Map &&
        body['data'] != null)
      return body['data'];
    return [];
  }
}
