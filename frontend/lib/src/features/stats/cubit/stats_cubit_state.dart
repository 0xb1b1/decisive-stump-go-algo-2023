import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cases/models/case.dart';
import '../../transactions/models/transaction.dart';
import '../models/news.dart';
part 'stats_cubit_state.freezed.dart';

@freezed
class StatsCubitState with _$StatsCubitState {
  const factory StatsCubitState.loading() = _Loading;

  const factory StatsCubitState.error() = _Error;

  const factory StatsCubitState.success({
    required List<News> news,
    required List<Transaction> transactions,
    required List<Case> cases,
  }) = _Success;
}

