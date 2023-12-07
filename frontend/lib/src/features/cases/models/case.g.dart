// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaseImpl _$$CaseImplFromJson(Map<String, dynamic> json) => _$CaseImpl(
      title: json['title'] as String,
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      weeklyProfitability: (json['weeklyProfitability'] as num).toDouble(),
      account: (json['account'] as num).toDouble(),
      sector: json['sector'] as String,
    );

Map<String, dynamic> _$$CaseImplToJson(_$CaseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'amount': instance.amount,
      'weeklyProfitability': instance.weeklyProfitability,
      'account': instance.account,
      'sector': instance.sector,
    };
