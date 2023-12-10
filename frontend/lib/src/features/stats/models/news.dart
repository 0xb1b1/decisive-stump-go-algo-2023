import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';

part 'news.g.dart';

@freezed
class News with _$News {
  const factory News({
    required String title,
    required String source,
    required DateTime date,
    required String url,
  }) = _News;

  factory News.mock() => News(
        title:
            'Politico узнало о жалобе Пентагона на медленное производство оружия',
        source: 'РБК',
        date: DateTime.now(),
        url: "https://quote.rbc.ru/news/article/6570390b9a79474f59a1da8f",
      );

  factory News.fromJson(Map<String, Object?> json) => _$NewsFromJson(json);
}
