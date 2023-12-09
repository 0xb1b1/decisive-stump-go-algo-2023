import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/api/models/article_list.dart';
import 'package:frontend/src/api/models/stock_info.dart';

class AppApi {
  final Dio _dio;

  const AppApi(this._dio);

  Future<Response<ArticleList>> getNews({
    required String from,
    required String to,
    required int limit,
  }) async {
    const path = r'https://backend.ds.seizure.icu/news/get';

    final queryParameters = <String, dynamic>{
      r'from_timestamp': from,
      r'to_timestamp': to,
      r'article_limit': limit,
    };

    final options = Options(
      method: r'GET',
      responseType: ResponseType.plain,
    );

    final response = await _dio.request(
      path,
      options: options,
      queryParameters: queryParameters,
    );

    ArticleList responseData;

    try {
      final Map<String, dynamic> map = json.decode(response.data!.toString());
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

  Future<Response<StockInfo>> getStocks({
    required String ticker,
  }) async {
    const path = r'https://backend.ds.seizure.icu/news/get';

    final queryParameters = <String, dynamic>{
      r'ticker': ticker,
    };

    final options = Options(
      method: r'GET',
      responseType: ResponseType.plain,
    );

    final response = await _dio.request(
      path,
      options: options,
      queryParameters: queryParameters,
    );

    StockInfo responseData;

    try {
      final Map<String, dynamic> map = json.decode(response.data!.toString());
      responseData = StockInfo.fromJson(map);
    } catch (error, stackTrace) {
      throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: error,
          stackTrace: stackTrace);
    }

    return Response<StockInfo>(
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
