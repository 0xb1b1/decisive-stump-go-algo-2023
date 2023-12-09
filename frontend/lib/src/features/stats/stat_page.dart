import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/features/stats/cubit/stats_cubit.dart';
import 'package:frontend/src/features/stats/widgets/graph_stats.dart';
import 'package:frontend/src/features/stats/widgets/news_block.dart';
import 'package:frontend/src/widgets/graph_widget.dart';
import 'package:frontend/src/widgets/info_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../common/strings.dart';
import '../../widgets/table/table.dart';
import '../cases/cases_page.dart';
import 'cubit/stats_cubit_state.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<StatsCubit>()..initialFetch(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 48,
            vertical: 36,
          ),
          child: BlocBuilder<StatsCubit, StatsCubitState>(
            builder: (BuildContext context, StatsCubitState state) {
              return state.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: AppPalette.mainBlue,
                  ),
                ),
                error: () => const Center(
                  child: Text(
                    "Произошла ошибка, попробуйте обновить страницу",
                    style: AppTypography.sectionTitle,
                  ),
                ),
                success: (news, transactions, cases) => ListView(
                  children: [
                    const Row(
                      children: [
                        Column(
                          children: [
                            InfoCard(
                              isPrimary: true,
                              title: Strings.totalToday,
                              rewardAmount: 500.44,
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            InfoCard(
                              title: Strings.bestCase,
                              rewardAmount: 500.44,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(child: GraphStats())
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TransactionTable(
                      transactions: transactions,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    NewsBlock(
                      newsList: news,
                      onNewsTap: BlocProvider.of<StatsCubit>(context).onNewsTap,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AllCasesBlock(
                      cases: cases,
                      onCaseTap: BlocProvider.of<StatsCubit>(context).onCaseTap,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
