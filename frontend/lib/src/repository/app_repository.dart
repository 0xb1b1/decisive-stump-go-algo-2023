import 'package:frontend/src/api/models/article_list.dart';
import 'package:frontend/src/api/models/company_info.dart';
import 'package:frontend/src/api/models/portfolio.dart';
import 'package:frontend/src/api/models/portfolios_dashboard.dart';
import 'package:frontend/src/repository/client_result.dart';
import 'dart:core';
import '../api/app_api.dart';

class AppRepository {
  final AppApi _api;

  AppRepository(AppApi api) : _api = api;

  Future<ClientResult<ArticleList>> getNews() async {
    try {
      final nowDate = DateTime.now();
      final from = nowDate.subtract(const Duration(days: 7)).toIso8601String();
      final to = nowDate.add(const Duration(days: 1)).toIso8601String();
      final response = await _api.getNews(from: from, to: to, limit: 30);
      final data = response.data;
      if (data == null) {
        return ClientResult.failed(Exception());
      } else {
        return ClientResult.succeed(data);
      }
    } catch (e, s) {
      return ClientResult.failed(e, s);
    }
  }

  Future<ClientResult<CompanyInfo>> getCompany(String ticker) async {
    try {
      final response = await _api.getCompany(ticker: ticker);
      final data = response.data;
      if (data == null) {
        return ClientResult.failed(Exception());
      } else {
        return ClientResult.succeed(data);
      }
    } catch (e, s) {
      return ClientResult.failed(e, s);
    }
  }

  Future<ClientResult<PortfoliosDashboard>> getAllPortfolios() async {
    try {
      final response = await _api.getAllPortfolios();
      final data = response.data;
      if (data == null) {
        return ClientResult.failed(Exception());
      } else {
        return ClientResult.succeed(data);
      }
    } catch (e, s) {
      return ClientResult.failed(e, s);
    }
  }

  Future<ClientResult<Portfolio>> getPortfolio(String uuid) async {
    try {
      final response = await _api.getPortfolio(uuid: uuid);
      final data = response.data;
      if (data == null) {
        return ClientResult.failed(Exception());
      } else {
        return ClientResult.succeed(data);
      }
    } catch (e, s) {
      return ClientResult.failed(e, s);
    }
  }
}
