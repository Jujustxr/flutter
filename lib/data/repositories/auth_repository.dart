// lib/data/repositories/auth_repository.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth_model.dart';

class AuthRepository {
  static const String _baseUrl = 'https://dummyjson.com';

  /// Login user — returns [AuthModel] on success
  Future<AuthModel> login({
    required String username,
    required String password,
    int expiresInMins = 30,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': expiresInMins,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return AuthModel.fromJson(data);
    } else {
      throw Exception(data['message'] ?? 'Login gagal');
    }
  }

  /// Get current authenticated user
  Future<Map<String, dynamic>> getMe({required String accessToken}) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/auth/me'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Gagal mengambil data user');
    }
  }

  /// Refresh access token
  Future<Map<String, dynamic>> refreshToken({
    required String refreshToken,
    int expiresInMins = 30,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/refresh'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'refreshToken': refreshToken,
        'expiresInMins': expiresInMins,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Gagal refresh token');
    }
  }
}