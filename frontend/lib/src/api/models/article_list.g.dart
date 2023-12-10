// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleListImpl _$$ArticleListImplFromJson(Map<String, dynamic> json) =>
    _$ArticleListImpl(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArticleListImplToJson(_$ArticleListImpl instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };
