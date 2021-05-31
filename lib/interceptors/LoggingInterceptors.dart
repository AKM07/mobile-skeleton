import 'dart:async';

import 'package:dio/dio.dart';

class LoggingInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    print(
        "<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response.requestOptions.baseUrl + dioError.response.requestOptions.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    print("<-- End error");
    super.onError(dioError, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    print("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    super.onResponse(response, handler);
  }
}
