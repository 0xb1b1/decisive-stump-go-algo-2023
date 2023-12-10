import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';

part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String title,
    required String source,
    required String tldr,
    required String link,
    required DateTime timestamp,
  }) = _Article;

  factory Article.mock() => Article(
        tldr: '',
        title:
            'Politico узнало о жалобе Пентагона на медленное производство оружия',
        source: 'РБК',
        timestamp: DateTime.now(),
        link: "https://quote.rbc.ru/news/article/6570390b9a79474f59a1da8f",
      );

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
