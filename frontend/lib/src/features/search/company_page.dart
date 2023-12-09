import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/src/features/search/widgets/company_about.dart';
import 'package:frontend/src/features/search/widgets/company_info_widget.dart';
import 'package:frontend/src/widgets/graph_widget.dart';
import 'package:frontend/src/widgets/income_widget.dart';

import '../../api/models/company_info.dart';
import '../../common/strings.dart';
import '../../common/theme/colors/app_palette.dart';

class CompanyPage extends StatelessWidget {
  final CompanyInfo company;
  final bool isInCase;

  const CompanyPage({
    required this.company,
    required this.isInCase,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppPalette.greyBg,
        backgroundColor: AppPalette.greyBg,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppPalette.greyText,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 36,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CompanyInfoWidget(
                      company: company,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: IncomeWidget(
                      isColored: isInCase,
                      title: isInCase ? Strings.currentProfit : Strings.currentCost,
                      onButtonTap: () {},
                      buttonTitle:
                          isInCase ? Strings.caseTransition : Strings.addToCase,
                      income: 2343.43,
                      // company.stockPrice.toDouble(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GraphWidget(
                      title: Strings.caseStats,
                      realDay: List.generate(
                          8, (index) => StockData(pointX: 10.0 + index, pointY: Random().nextDouble() * 1000 + 300)),
                      predictedDay: List.generate(
                          2, (index) => StockData(pointX: 18.0 + index, pointY: Random().nextDouble() * 1000 + 300)),
                      realWeek: List.generate(
                          8, (index) => StockData(pointX: index / 2, pointY: Random().nextDouble() * 1000 + 300)),
                      predictedWeek: List.generate(
                          2, (index) => StockData(pointX: (8 + index) / 2, pointY: Random().nextDouble() * 1000 + 300)),
                      realMonth: List.generate(
                          8, (index) => StockData(pointX: index * 2, pointY: Random().nextDouble() * 1000 + 300)),
                      predictedMonth: List.generate(
                          2, (index) => StockData(pointX: (8 + index) * 2, pointY: Random().nextDouble() * 1000 + 300)),
                      realHalfYear: List.generate(
                          8, (index) => StockData(pointX: index / 2, pointY: Random().nextDouble() * 1000 + 300)),
                      predictedHalfYear: List.generate(
                          2, (index) => StockData(pointX: (8 + index) / 2, pointY: Random().nextDouble() * 1000 + 300)),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: CompanyAbout(
                      about: (company.description != null
                          ? company.description!
                          : 'Описание компании'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
