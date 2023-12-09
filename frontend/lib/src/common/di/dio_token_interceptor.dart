import 'package:dio/dio.dart';

class DioTokenInterceptor extends Interceptor {
  final String _token;

  DioTokenInterceptor({required String token}) : _token = token;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['Authorization'] = "Bearer $_token";
    handler.next(options);
  }
}
