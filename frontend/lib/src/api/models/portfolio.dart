import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/api/models/portfolio_stock.dart';

part 'portfolio.freezed.dart';

part 'portfolio.g.dart';

@freezed
class Portfolio with _$Portfolio {
  const factory Portfolio({
    required String uuid,
    required String sector,
    @Default('0.00') String balance,
    @JsonKey(name: 'profit_weekly_percent')
    @Default('0.00')
    String profitWeeklyPercent,
    @Default('0.00') String profit,
    required List<PortfolioStock> stocks,
  }) = _Portfolio;

  factory Portfolio.fromJson(Map<String, dynamic> json) =>
      _$PortfolioFromJson(json);
}
