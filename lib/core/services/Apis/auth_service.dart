import 'dart:convert';

import 'package:e_commerce/core/network/api_client.dart';
import 'package:e_commerce/core/network/end_pointe.dart';
import 'package:e_commerce/core/services/Apis/troken_storage.dart';

class AuthService {
  final ApiClient _apiClient;

  AuthService({ApiClient? apiClient})
    : _apiClient =
          apiClient ?? ApiClient();

  Future<bool> login(
    String email,
    String password,
  ) async {
    final response = await _apiClient
        .post(
          Endpoints.login,
          includeAuth: false,
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
        );

    if (response != null &&
        response.statusCode == 200) {
      final body = ApiClient.decodeBody(
        response.body,
      );
      final newToken = body['token'];
      if (newToken != null) {
        await TokenStorage.setToken(
          newToken,
        );
        return true;
      }
    }
    return false;
  }

  Future<bool> logout() async {
    final response = await _apiClient
        .post(
          Endpoints.logout,
          includeAuth: true,
        );
    if (response != null &&
        response.statusCode == 200) {
      await TokenStorage.clearToken();
      return true;
    }
    return false;
  }

  Future<bool>
  get isAuthenticated async =>
      await TokenStorage.hasToken();
}
