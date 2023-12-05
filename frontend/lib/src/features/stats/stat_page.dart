import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/features/stats/widgets/graph_stats.dart';
import 'package:frontend/src/features/transactions/models/transaction.dart';
import 'package:frontend/src/widgets/info_card.dart';

import '../../common/strings.dart';
import '../../widgets/table/table.dart';

class StatPage extends StatelessWidget {
  const StatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.greyBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 36,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                Column(
                  children: const [
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
                const SizedBox(
                  width: 24,
                ),
                const Expanded(child: GraphStats())
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            TransactionTable(
              transactions: mockedTransactions,
            ),
          ],
        ),
      ),
    );
  }
}
