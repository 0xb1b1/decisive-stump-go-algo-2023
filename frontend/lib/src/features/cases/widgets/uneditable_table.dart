import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/api/models/portfolio_stock.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/features/cases/cubit/case_cubit.dart';
import '../../../common/strings.dart';
import '../../../common/theme/border_radius/border_radius.dart';
import '../../../common/theme/colors/app_palette.dart';

class UneditableTable extends StatelessWidget {
  final List<PortfolioStock> companies;

  const UneditableTable({
    Key? key,
    required this.companies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(largeRadius),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  Strings.companies,
                  style: AppTypography.sectionTitle,
                ),
                TextButton(
                  onPressed: BlocProvider.of<CaseCubit>(context).onEditTap,
                  child: const Text(Strings.edit),
                ),
              ],
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: companies.length,
              itemBuilder: (context, index) {
                final company = companies[index];
                return Column(
                  children: [
                    const Divider(
                      color: AppPalette.greyBg,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(company.company),
                        Text(
                          (double.parse(company.profitDailyPercent) >= 0
                              ? "+${company.profitDailyPercent} %"
                              : "-${company.profitDailyPercent} %"),
                          style: TextStyle(
                            color: double.parse(company.profitDailyPercent) >= 0
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
