// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockInfoImpl _$$StockInfoImplFromJson(Map<String, dynamic> json) =>
    _$StockInfoImpl(
      symbol: json['symbol'] as String,
      company: json['company'] as String?,
      description: json['description'] as String?,
      sector: json['sector'] as String?,
    );

Map<String, dynamic> _$$StockInfoImplToJson(_$StockInfoImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'company': instance.company,
      'description': instance.description,
      'sector': instance.sector,
    };
