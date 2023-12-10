// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_stripped.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfolioStrippedImpl _$$PortfolioStrippedImplFromJson(
        Map<String, dynamic> json) =>
    _$PortfolioStrippedImpl(
      uuid: json['uuid'] as String,
      sector: json['sector'] as String,
      profit: json['profit'] as String? ?? '0.00',
    );

Map<String, dynamic> _$$PortfolioStrippedImplToJson(
        _$PortfolioStrippedImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'sector': instance.sector,
      'profit': instance.profit,
    };
