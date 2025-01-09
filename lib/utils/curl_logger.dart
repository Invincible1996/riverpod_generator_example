import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class CurlLoggerInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      var curlString = '''
-----------------------------------------------------------------------
 请求时间： ${DateTime.now().toIso8601String()}
curl '${options.baseUrl}${options.path}' 
-H 'Accept: application/json' 
-H 'Content-Type: application/json' 
-H 'V-Token: ${options.headers['V-Token']}' 
-H 'V-Token-Type: ${options.headers['V-Token-Type']}' 
-H 'Authorization:
${options.headers['Authorization']}' 
--data-raw '${options.data != null ? json.encode(options.data) : ''}'
-----------------------------------------------------------------------
''';
      log(curlString);
    } catch (e) {
      log('CurlLoggerInterceptor error: $e');
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // if response.data is List
    var jsonObject = json.decode(json.encode(response.data));

    // 格式化JSON字符串
    var prettyJsonString =
        const JsonEncoder.withIndent('  ').convert(jsonObject);

    // 输出格式化的JSON字符串
    log(''''🚀--Response----------${response.requestOptions.uri}--
$prettyJsonString
---------------------------------------------------'🚀
''');

    super.onResponse(response, handler);
  }
}
