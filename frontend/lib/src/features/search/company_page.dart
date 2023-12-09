import 'package:flutter/material.dart';
import 'package:frontend/src/features/search/widgets/company_about.dart';
import 'package:frontend/src/widgets/graph_widget.dart';
import 'package:frontend/src/widgets/income_widget.dart';

import '../../common/strings.dart';
import '../../common/theme/colors/app_palette.dart';
import '../cases/models/company.dart';
import 'widgets/company_info.dart';

class CompanyPage extends StatelessWidget {
  final Company company;
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
                    child: CompanyInfo(
                      company: company,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: IncomeWidget(
                      title: isInCase
                          ? Strings.currentProfit
                          : Strings.currentCost,
                      onButtonTap: () {},
                      buttonTitle:
                          isInCase ? Strings.caseTransition : Strings.addToCase,
                      income: company.amount,
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
                  const Expanded(
                    flex: 2,
                    child: GraphWidget(
                      title: Strings.caseStats,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: CompanyAbout(
                      about: company.about,
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
