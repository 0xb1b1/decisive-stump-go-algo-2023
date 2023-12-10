import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_stock.freezed.dart';

part 'portfolio_stock.g.dart';

@freezed
class PortfolioStock with _$PortfolioStock {
  const factory PortfolioStock({
    required String ticker,
    required String company,
    @JsonKey(name: 'profit_daily_percent')
    @Default('0.000')
    String profitDailyPercent,
    @Default(0) int amount,
    @JsonKey(name: 'price_per_share') @Default('0.00') String pricePerShare,
    @JsonKey(name: 'price_sum') @Default('0.00') String priceSum,
    @JsonKey(name: 'is_paused') @Default(false) bool isPaused,
    @JsonKey(name: 'is_disabled') @Default(false) bool isDisabled,
  }) = _PortfolioStock;

  factory PortfolioStock.fromJson(Map<String, dynamic> json) =>
      _$PortfolioStockFromJson(json);
}
