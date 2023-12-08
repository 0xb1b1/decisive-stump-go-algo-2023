// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      title: json['title'] as String,
      income: (json['income'] as num).toDouble(),
      ticker: json['ticker'] as String,
      count: json['count'] as int,
      amountSingle: (json['amountSingle'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'income': instance.income,
      'ticker': instance.ticker,
      'count': instance.count,
      'amountSingle': instance.amountSingle,
      'amount': instance.amount,
    };
