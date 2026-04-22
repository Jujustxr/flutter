import 'package:dio/dio.dart';

class AuthRepository {

  // Ganti dengan base URL API dari dosen nanti
  final String baseUrl = 'https://your-api-url.com';

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      // Nanti uncomment ini kalau API udah ada:
      // final response = await _dio.post(
      //   '$baseUrl/login',
      //   data: {'email': email, 'password': password},
      // );
      // return response.data['token'];

      // Mock sementara — simulasi delay API
      await Future.delayed(const Duration(seconds: 2));

      // Simulasi cek login
      if (email == 'test@email.com' && password == '123456') {
        return 'login_success';
      } else {
        throw Exception('Email atau password salah');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Terjadi kesalahan');
    }
  }

  Future<String> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Nanti uncomment ini kalau API udah ada:
      // final response = await _dio.post(
      //   '$baseUrl/register',
      //   data: {'name': name, 'email': email, 'password': password},
      // );
      // return response.data['message'];

      // Mock sementara
      await Future.delayed(const Duration(seconds: 2));
      return 'register_success';
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Terjadi kesalahan');
    }
  }
}