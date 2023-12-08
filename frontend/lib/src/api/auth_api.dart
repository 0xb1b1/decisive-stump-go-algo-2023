import 'dart:convert';

import 'package:dio/dio.dart';

class AuthApi {
  final Dio _dio;

  const AuthApi(this._dio);

  Future<Response<String>> login({
    required String email,
    required String password,
  }) async {
    const path = r'http://217.151.229.24:2280/auth/login';

    final postData = <String, dynamic>{
      r'email': email,
      r'password_hash': password,
    };

    final options = Options(
      method: r'POST',
    );

    final response = await _dio.request<String>(
      path,
      options: options,
      data: postData,
    );

    String responseData;

    try {
      final Map<String, dynamic> map = jsonDecode(response.data!.toString());
      print(map.toString());
      responseData = map["access_token"];
    } catch (error, stackTrace) {
      throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: error,
          stackTrace: stackTrace);
    }

    return Response<String>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  Future<Response<String>> signUp({
    required String email,
    required String password,
  }) async {
    const path = r'http://217.151.229.24:2280/auth/signup';

    final options = Options(
      method: r'POST',
    );
    final postData = <String, dynamic>{
      r'email': email,
      r'password_hash': password,
      r'first_name': "string",
      r'last_name': "string",
    };

    final response = await _dio.request<String>(
      path,
      options: options,
      data: postData,
    );

    String responseData;

    try {
      final Map<String, dynamic> map = jsonDecode(response.data!.toString());
      responseData = map["access_token"];
    } catch (error, stackTrace) {
      throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: error,
          stackTrace: stackTrace);
    }

    return Response<String>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }
}
