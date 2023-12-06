// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      title: json['title'] as String,
      source: json['source'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'source': instance.source,
      'date': instance.date.toIso8601String(),
    };
