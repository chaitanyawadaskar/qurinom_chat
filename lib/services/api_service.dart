import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class ApiService {
  final String baseUrl = ApiConfig.baseUrl;

  Future<http.Response> post(String path, Map<String, dynamic> body,
      {String? token}) async {
    final uri = Uri.parse('$baseUrl$path');
    final headers = {'Content-Type': 'application/json'};
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    final resp = await http.post(uri, body: jsonEncode(body), headers: headers);
    return resp;
  }

  Future<http.Response> get(String path, {String? token}) async {
    final uri = Uri.parse('$baseUrl$path');
    final headers = {'Accept': 'application/json'};
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    final resp = await http.get(uri, headers: headers);
    return resp;
  }
}
