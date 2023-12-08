import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/api/models/article.dart';

part 'article_list.freezed.dart';

part 'article_list.g.dart';

@freezed
class ArticleList with _$ArticleList {
  const factory ArticleList({
    required List<Article> articles,
  }) = _ArticleList;

  factory ArticleList.fromJson(Map<String, dynamic> json) =>
      _$ArticleListFromJson(json);
}
