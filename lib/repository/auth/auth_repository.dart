import 'package:dio/dio.dart';
import 'package:riverpod_generator_example/model/auth/auth_req.dart';
import 'package:riverpod_generator_example/model/auth/auth_res.dart';
import '../../service/network_service.dart';

class AuthRepository {
  final NetworkService _networkService;

  AuthRepository(this._networkService);

  Future<AuthRes> login(AuthReq authReq) async {
    try {
      final response = await _networkService.post(
        '/auth/login',
        data: authReq.toJson(),
      );
      return AuthRes.fromJson(response);
    } catch (e) {
      if (e is DioException) {
        throw Exception('Login failed: ${e.message}');
      }
      throw Exception('Login failed: $e');
    }
  }

  Future<Map<String, dynamic>> register(
      String email, String password, String username) async {
    try {
      final response = await _networkService.post('/auth/register', data: {
        'email': email,
        'password': password,
        'username': username,
      });
      return response;
    } catch (e) {
      if (e is DioException) {
        throw Exception('Registration failed: ${e.message}');
      }
      throw Exception('Registration failed: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _networkService.post('/auth/logout');
    } catch (e) {
      if (e is DioException) {
        throw Exception('Logout failed: ${e.message}');
      }
      throw Exception('Logout failed: $e');
    }
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    try {
      final response = await _networkService.post('/auth/refresh', data: {
        'refresh_token': refreshToken,
      });
      return response;
    } catch (e) {
      if (e is DioException) {
        throw Exception('Token refresh failed: ${e.message}');
      }
      throw Exception('Token refresh failed: $e');
    }
  }
}
