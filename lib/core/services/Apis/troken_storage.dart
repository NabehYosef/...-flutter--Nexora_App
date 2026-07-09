import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String authTokenKey =
      'token';

  static Future<SharedPreferences>
  _prefs() async {
    return SharedPreferences.getInstance();
  }

  static Future<String>
  getToken() async {
    final prefs = await _prefs();
    return prefs.getString(
          authTokenKey,
        ) ??
        '';
  }

  static Future<void> setToken(
    String token,
  ) async {
    final prefs = await _prefs();
    await prefs.setString(
      authTokenKey,
      token,
    );
  }

  static Future<void>
  clearToken() async {
    final prefs = await _prefs();
    await prefs.remove(authTokenKey);
  }

  static Future<bool> hasToken() async {
    final token = await getToken();
    return token.isNotEmpty;
  }
}
