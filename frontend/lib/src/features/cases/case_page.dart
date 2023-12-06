import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/widgets/info_card.dart';

import '../../common/strings.dart';
import 'models/case.dart';

class CasesPage extends StatelessWidget {
  final List<Case> cases;
  final VoidCallback onCaseTap;

  const CasesPage({
    required this.cases,
    required this.onCaseTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 36,
        ),
        child: AllCasesBlock(
          cases: cases,
          onCaseTap: onCaseTap,
        ),
      ),
    );
  }
}

class AllCasesBlock extends StatelessWidget {
  final List<Case> cases;
  final VoidCallback onCaseTap;

  const AllCasesBlock({
    required this.cases,
    required this.onCaseTap,
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
    final gridHeight = (208 * numberRows + 24 * (numberRows - 1)).toDouble();

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
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            crossAxisCount: 3,
            children: cases
                .map(
                  (e) => InfoCard(
                    title: Strings.singleCase,
                    rewardAmount: e.amount,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
