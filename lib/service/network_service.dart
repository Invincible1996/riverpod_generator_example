import 'package:dio/dio.dart';
import 'package:riverpod_generator_example/utils/curl_logger.dart';

import 'interceptors/request_interceptor.dart';

class NetworkService {
  final Dio _dio = Dio();

  NetworkService() {
    _dio.options.baseUrl =
        'https://dummyjson.com'; // Replace with your API base URL
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
    // add interceptor
    _dio.interceptors
      ..add(CurlLoggerInterceptor())
      ..add(
        RequestInterceptor(),
      );
  }

  // set header
  void setHeader(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (_) {
      // Handle Dio errors
      rethrow;
    } catch (e) {
      // Handle other errors
      rethrow;
    }
  }

  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioException catch (_) {
      // Handle Dio errors
      rethrow;
    } catch (e) {
      // Handle other errors
      rethrow;
    }
  }

  // Add other methods like put, delete, etc. as needed
  // put
  Future<dynamic> put(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response.data;
    } on DioException catch (_) {
      // Handle Dio errors
      rethrow;
    } catch (e) {
      // Handle other errors
      rethrow;
    }
  }

  // delete
  Future<dynamic> delete(String path, {dynamic data}) async {
    try {
      final response = await _dio.delete(path, data: data);
      return response.data;
    } on DioException catch (_) {
      // Handle Dio errors
      rethrow;
    } catch (e) {
      // Handle other errors
      rethrow;
    }
  }
}
