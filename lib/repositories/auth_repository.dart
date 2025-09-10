import 'dart:convert';
import 'package:qurinom_project/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class AuthRepository {
  final ApiService _api = ApiService();
  static const _tokenKey = 'auth_token';
  static const _userIdKey = 'user_id';

  Future<UserModel> login(String email, String password, String role) async {
    final body = {'email': email, 'password': password, 'role': role};
    final resp = await _api.post('/user/login', body);
    if (resp.statusCode == 200) {
      final json = jsonDecode(resp.body);
      final user = UserModel.fromJson(json);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.data?.token ?? "");
      await prefs.setString('userId', user.data?.user?.id ?? "");
      return user;
    } else {
      throw Exception('Login failed: \${resp.body}');
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userIdKey);
  }
}
