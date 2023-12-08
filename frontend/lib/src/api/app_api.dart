import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/api/models/article_list.dart';

class AppApi {
  final Dio _dio;

  const AppApi(this._dio);

  Future<Response<ArticleList>> getNews({
    required String from,
    required String to,
    required int limit,
  }) async {
    const path = r'http://217.151.229.24:2280/news/get';

    final queryParameters = <String, dynamic>{
      r'from_timestamp': from,
      r'to_timestamp': to,
      r'article_limit': limit,
    };

    final options = Options(
      method: r'GET',
    );

    final response = await _dio.request(
      path,
      options: options,
      queryParameters: queryParameters,
    );

    ArticleList responseData;

    try {
      final Map<String, dynamic> map = jsonDecode(response.data!.toString());
      responseData = ArticleList.fromJson(map);
    } catch (error, stackTrace) {
      throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: error,
          stackTrace: stackTrace);
    }

    return Response<ArticleList>(
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
