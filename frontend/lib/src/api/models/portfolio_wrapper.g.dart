// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfolioWrapperImpl _$$PortfolioWrapperImplFromJson(
        Map<String, dynamic> json) =>
    _$PortfolioWrapperImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      numberEnd: json['numberEnd'] as int,
      money: json['money'] as int,
    );

Map<String, dynamic> _$$PortfolioWrapperImplToJson(
        _$PortfolioWrapperImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'numberEnd': instance.numberEnd,
      'money': instance.money,
    };
