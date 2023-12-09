// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      title: json['title'] as String,
      income: (json['income'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      recomendation: json['recomendation'] as String,
      sector: json['sector'] as String,
      ticker: json['ticker'] as String,
      count: json['count'] as int,
      amountSingle: (json['amountSingle'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      about: json['about'] as String,
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'income': instance.income,
      'currentPrice': instance.currentPrice,
      'recomendation': instance.recomendation,
      'sector': instance.sector,
      'ticker': instance.ticker,
      'count': instance.count,
      'amountSingle': instance.amountSingle,
      'amount': instance.amount,
      'about': instance.about,
    };
