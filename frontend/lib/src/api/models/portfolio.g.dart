// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfolioImpl _$$PortfolioImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioImpl(
      uuid: json['uuid'] as String,
      sector: json['sector'] as String,
      balance: json['balance'] as String? ?? '0.00',
      profitWeeklyPercent: json['profit_weekly_percent'] as String? ?? '0.00',
      profit: json['profit'] as String? ?? '0.00',
      stocks: (json['stocks'] as List<dynamic>)
          .map((e) => PortfolioStock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PortfolioImplToJson(_$PortfolioImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'sector': instance.sector,
      'balance': instance.balance,
      'profit_weekly_percent': instance.profitWeeklyPercent,
      'profit': instance.profit,
      'stocks': instance.stocks,
    };
