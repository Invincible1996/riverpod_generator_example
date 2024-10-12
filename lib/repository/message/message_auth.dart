import 'package:dio/dio.dart';
import '../../service/network_service.dart';

class MessageAuthRepository {
  final NetworkService _networkService;

  MessageAuthRepository(this._networkService);

  Future<Map<String, dynamic>> getMessageList({int? page, int? limit}) async {
    try {
      final response = await _networkService.get('/messages', queryParameters: {
        if (page != null) 'page': page,
        if (limit != null) 'limit': limit,
      });
      return response;
    } catch (e) {
      if (e is DioException) {
        throw Exception('Failed to get message list: ${e.message}');
      }
      throw Exception('Failed to get message list: $e');
    }
  }

  Future<int> getMessageCount() async {
    try {
      final response = await _networkService.get('/messages/count');
      return response['count'];
    } catch (e) {
      if (e is DioException) {
        throw Exception('Failed to get message count: ${e.message}');
      }
      throw Exception('Failed to get message count: $e');
    }
  }
}
