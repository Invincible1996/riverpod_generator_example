import 'package:dio/dio.dart';

import '../../model/user/user_model.dart';
import '../../service/network_service.dart';

class UserRepository {
  final NetworkService _networkService;

  UserRepository(this._networkService);

  Future<UserModel> getCurrentUser() async {
    try {
      final response = await _networkService.get('/auth/me');
      return UserModel.fromJson(response);
    } catch (e) {
      if (e is DioException) {
        throw Exception('Failed to get current user: ${e.message}');
      }
      throw Exception('Failed to get current user: $e');
    }
  }
}
