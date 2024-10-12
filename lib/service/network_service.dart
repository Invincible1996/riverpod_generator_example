import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio = Dio();

  NetworkService() {
    _dio.options.baseUrl =
        'https://dummyjson.com'; // Replace with your API base URL
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      // Handle Dio errors
      print('Dio error: ${e.message}');
      rethrow;
    } catch (e) {
      // Handle other errors
      print('Error: $e');
      rethrow;
    }
  }

  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioException catch (e) {
      // Handle Dio errors
      print('Dio error: ${e.message}');
      rethrow;
    } catch (e) {
      // Handle other errors
      print('Error: $e');
      rethrow;
    }
  }

  // Add other methods like put, delete, etc. as needed
}
