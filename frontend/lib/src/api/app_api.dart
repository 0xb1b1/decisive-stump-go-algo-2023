import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/api/models/article_list.dart';
import 'package:frontend/src/api/models/portfolio.dart';

import 'models/company_info.dart';
import 'models/portfolios_dashboard.dart';

class AppApi {
  final Dio _dio;

  const AppApi(this._dio);

  Future<Response<ArticleList>> getNews({
    required String from,
    required String to,
    required int limit,
  }) async {
    const path = r'https://backend.ds.seizure.icu/news/get_news';

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

  Future<Response<CompanyInfo>> getCompany({
    required String ticker,
  }) async {
    const path = r'https://backend.ds.seizure.icu/company/info_company';

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

    CompanyInfo responseData;

    try {
      final Map<String, dynamic> map = jsonDecode(response.data!.toString());
      responseData = CompanyInfo.fromJson(map);
    } catch (error, stackTrace) {
      throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: error,
          stackTrace: stackTrace);
    }

    return Response<CompanyInfo>(
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

  Future<Response<PortfoliosDashboard>> getAllPortfolios() async {
    const path = r'https://backend.ds.seizure.icu/portfolio/get_all_portfolios';

    final options = Options(
      method: r'GET',
      responseType: ResponseType.plain,
    );

    final response = await _dio.request(
      path,
      options: options,
    );

    PortfoliosDashboard responseData;

    try {
      final Map<String, dynamic> map = jsonDecode(response.data!.toString());
      responseData = PortfoliosDashboard.fromJson(map);
    } catch (error, stackTrace) {
      throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: error,
          stackTrace: stackTrace);
    }

    return Response<PortfoliosDashboard>(
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

  Future<Response<Portfolio>> getPortfolio({
    required String uuid,
  }) async {
    const path = r'https://backend.ds.seizure.icu/portfolio/get_portfolio';

    final queryParameters = <String, dynamic>{
      r'uuid': uuid,
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

    Portfolio responseData;

    try {
      final Map<String, dynamic> map = jsonDecode(response.data!.toString());
      responseData = Portfolio.fromJson(map);
    } catch (error, stackTrace) {
      throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: error,
          stackTrace: stackTrace);
    }

    return Response<Portfolio>(
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
