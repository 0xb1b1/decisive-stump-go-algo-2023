// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfolioStockImpl _$$PortfolioStockImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioStockImpl(
      ticker: json['ticker'] as String,
      company: json['company'] as String,
      profitDailyPercent: json['profit_daily_percent'] as String? ?? '0.000',
      amount: json['amount'] as int? ?? 0,
      pricePerShare: json['price_per_share'] as String? ?? '0.00',
      priceSum: json['price_sum'] as String? ?? '0.00',
      isPaused: json['is_paused'] as bool? ?? false,
      isDisabled: json['is_disabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$PortfolioStockImplToJson(
        _$PortfolioStockImpl instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'company': instance.company,
      'profit_daily_percent': instance.profitDailyPercent,
      'amount': instance.amount,
      'price_per_share': instance.pricePerShare,
      'price_sum': instance.priceSum,
      'is_paused': instance.isPaused,
      'is_disabled': instance.isDisabled,
    };
