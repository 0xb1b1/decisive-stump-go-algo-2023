// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyInfoImpl _$$CompanyInfoImplFromJson(Map<String, dynamic> json) =>
    _$CompanyInfoImpl(
      name: json['name'] as String?,
      ticker: json['ticker'] as String,
      sector: json['sector'] as String?,
      description: json['description'] as String?,
      stockPrice: json['stock_price'] as String,
      prognosisPercentage: json['prognosis_percentage'] as String,
      recommendation: StockActionRecommendation.fromJson(
          json['recommendation'] as Map<String, dynamic>),
      portfolioUuid: json['portfolio_uuid'] as String?,
    );

Map<String, dynamic> _$$CompanyInfoImplToJson(_$CompanyInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ticker': instance.ticker,
      'sector': instance.sector,
      'description': instance.description,
      'stock_price': instance.stockPrice,
      'prognosis_percentage': instance.prognosisPercentage,
      'recommendation': instance.recommendation,
      'portfolio_uuid': instance.portfolioUuid,
    };

_$StockActionRecommendationImpl _$$StockActionRecommendationImplFromJson(
        Map<String, dynamic> json) =>
    _$StockActionRecommendationImpl(
      color: json['color'] as String,
      recommendation: json['recommendation'] as String,
    );

Map<String, dynamic> _$$StockActionRecommendationImplToJson(
        _$StockActionRecommendationImpl instance) =>
    <String, dynamic>{
      'color': instance.color,
      'recommendation': instance.recommendation,
    };
