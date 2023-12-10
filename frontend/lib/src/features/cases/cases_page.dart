import 'package:flutter/material.dart';
import 'package:frontend/src/api/models/portfolio_stripped.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/features/cases/case_details.dart';
import 'package:frontend/src/features/cases/provider/cases_provider.dart';
import 'package:frontend/src/widgets/info_card.dart';
import 'package:provider/provider.dart';

import '../../common/strings.dart';

class CasesPage extends StatelessWidget {
  const CasesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<CasesProvider>(context).data.strippedPortfolios;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 36,
        ),
        child: AllCasesBlock(
          cases: cases,
        ),
      ),
    );
  }
}

class AllCasesBlock extends StatelessWidget {
  final List<PortfolioStripped> cases;

  const AllCasesBlock({
    required this.cases,
    Key? key,
  }) : super(key: key);

  int calculateNumberOfRows(int itemCount, int crossAxisCount) {
    final int fullRows = itemCount ~/ crossAxisCount;
    final bool hasPartialRow = itemCount % crossAxisCount != 0;
    return hasPartialRow ? fullRows + 1 : fullRows;
  }

  @override
  Widget build(BuildContext context) {
    final numberRows = calculateNumberOfRows(cases.length, 3);
    final gridHeight =
        (208 * numberRows + 24 * (numberRows - 1)).toDouble() - 8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Strings.allCases,
          style: AppTypography.sectionTitle,
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: gridHeight,
          child: GridView.count(
            childAspectRatio: 1.66346153846,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            crossAxisCount: 3,
            children: cases
                .map(
                  (e) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CaseDetails(
                          portfolioUuid: e.uuid,
                        ),
                      ),
                    ),
                    child: InfoCard(
                      title: '${Strings.singleCase}\n«${e.sector}»',
                      rewardAmount: double.parse(e.profit),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
