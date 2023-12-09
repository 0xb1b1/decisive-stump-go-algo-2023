import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/api/models/article_list.dart';
import 'package:frontend/src/features/stats/cubit/stats_cubit_state.dart';
import 'package:frontend/src/features/transactions/models/transaction.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/models/article.dart';
import '../../../repository/app_repository.dart';
import '../../cases/models/case.dart';
import '../models/news.dart';

class StatsCubit extends Cubit<StatsCubitState> {
  final AppRepository _repository;

  StatsCubit({required AppRepository repository})
      : _repository = repository,
        super(const StatsCubitState.loading());

  Future<void> initialFetch() async {
    final response = await _repository.getNews();
    final ArticleList resultNews;
    final value = response.value;
    if (!response.succeed || value == null) {
      resultNews = ArticleList(
        articles: List.generate(
          30,
          (index) => Article.mock(),
        ),
      );
    } else {
      resultNews = value;
    }

    final transactions = mockedTransactions;
    final cases = List.generate(
      8,
      (index) => Case.mock(),
    );
    emit(
      StatsCubitState.success(
        news: resultNews,
        transactions: transactions,
        cases: cases,
      ),
    );
  }

  Future<void> onNewsTap(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void onCaseTap() {}
}
