import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/api/models/article_list.dart';
import 'package:frontend/src/api/models/portfolios_dashboard.dart';

import '../../transactions/models/transaction.dart';

part 'stats_cubit_state.freezed.dart';

@freezed
class StatsCubitState with _$StatsCubitState {
  const factory StatsCubitState.loading() = _Loading;

  const factory StatsCubitState.error() = _Error;

  const factory StatsCubitState.success({
    required ArticleList news,
    required List<Transaction> transactions,
    required PortfoliosDashboard cases,
  }) = _Success;
}
