// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolios_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfoliosDashboardImpl _$$PortfoliosDashboardImplFromJson(
        Map<String, dynamic> json) =>
    _$PortfoliosDashboardImpl(
      strippedPortfolios: (json['stripped_portfolios'] as List<dynamic>)
          .map((e) => PortfolioStripped.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PortfoliosDashboardImplToJson(
        _$PortfoliosDashboardImpl instance) =>
    <String, dynamic>{
      'stripped_portfolios': instance.strippedPortfolios,
    };
