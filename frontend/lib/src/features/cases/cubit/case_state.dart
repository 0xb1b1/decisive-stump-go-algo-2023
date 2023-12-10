import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/api/models/portfolio.dart';
import 'package:frontend/src/api/models/portfolio_stock.dart';

part 'case_state.freezed.dart';

@freezed
class CaseState with _$CaseState {
  const factory CaseState.loading() = _Loading;

  const factory CaseState.stats({
    required Portfolio portfolio,
    required List<PortfolioStock> companies,
  }) = _Stats;

  const factory CaseState.editing({
    required Portfolio portfolio,
    required List<PortfolioStock> inCase,
    required List<PortfolioStock> stopped,
    required List<PortfolioStock> inActive,
  }) = _Editing;
}
