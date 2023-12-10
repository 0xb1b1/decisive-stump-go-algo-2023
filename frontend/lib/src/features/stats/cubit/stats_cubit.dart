import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/api/models/article_list.dart';
import 'package:frontend/src/api/models/portfolio_stripped.dart';
import 'package:frontend/src/api/models/portfolios_dashboard.dart';
import 'package:frontend/src/features/stats/cubit/stats_cubit_state.dart';
import 'package:frontend/src/features/transactions/models/transaction.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/models/article.dart';
import '../../../repository/app_repository.dart';

class StatsCubit extends Cubit<StatsCubitState> {
  final AppRepository _repository;

  StatsCubit({required AppRepository repository})
      : _repository = repository,
        super(const StatsCubitState.loading());

  Future<void> initialFetch() async {
    final newsResponse = await _repository.getNews();
    final ArticleList resultNews;
    final valueNews = newsResponse.value;
    if (!newsResponse.succeed || valueNews == null) {
      resultNews = ArticleList(
        articles: List.generate(
          30,
          (index) => Article.mock(),
        ),
      );
    } else {
      resultNews = valueNews;
    }

    final portfoliosResponse = await _repository.getAllPortfolios();
    final PortfoliosDashboard resultPortfolios;
    final valuePortfolios = portfoliosResponse.value;
    if (!portfoliosResponse.succeed || valuePortfolios == null) {
      resultPortfolios = PortfoliosDashboard(
        strippedPortfolios: List.generate(
          8,
          (index) => PortfolioStripped.mock(),
        ),
      );
    } else {
      resultPortfolios = valuePortfolios;
    }

    final transactions = mockedTransactions;

    emit(
      StatsCubitState.success(
        news: resultNews,
        transactions: transactions,
        cases: resultPortfolios,
      ),
    );
  }

  Future<void> onNewsTap(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

}
