import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/stats/cubit/stats_cubit_state.dart';
import 'package:frontend/src/features/transactions/models/transaction.dart';

import '../../cases/models/case.dart';
import '../models/news.dart';

class StatsCubit extends Cubit<StatsCubitState> {
  StatsCubit() : super(const StatsCubitState.loading());

  Future<void> initialFetch() async {
    final news = List.generate(
      30,
      (index) => News.mock(),
    );
    final transactions = mockedTransactions;
    final cases = List.generate(
      8,
      (index) => Case.mock(),
    );
    emit(StatsCubitState.success(
        news: news, transactions: transactions, cases: cases));
  }

  void onNewsTap() {}

  void onCaseTap() {}
}
