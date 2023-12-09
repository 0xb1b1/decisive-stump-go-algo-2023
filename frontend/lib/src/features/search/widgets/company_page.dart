import 'package:flutter/material.dart';
import 'package:frontend/src/widgets/income_widget.dart';

import '../../cases/models/company.dart';
import 'company_info.dart';

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
                  IncomeWidget(
                    title: 'Текущая стоимость',
                    onButtonTap: () {},
                    buttonTitle: 'Добавить в портфель',
                    income: company.amount,
                  ),
                ],
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: child,
            //         flex: 2,
            //       ),
            //       SizedBox(
            //         width: 24,
            //       ),
            //       Expanded(child: child)
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
