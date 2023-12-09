import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';

import '../../../common/strings.dart';
import '../../../common/theme/border_radius/border_radius.dart';
import '../../cases/models/company.dart';

class CompanyInfo extends StatelessWidget {
  final Company company;

  const CompanyInfo({required this.company, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parts = company.amount.toString().split('.');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 33),
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(largeRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                company.title,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.caseTitle,
              ),
              Text(
                company.ticker,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.caseTitle,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Parameter(
                title: "Прогноз на 8 часов",
                value: RichText(
                  text: TextSpan(
                    text: '+ ${parts[0]}',
                    style: AppTypography.sectionTitle,
                    children: parts.length > 1
                        ? [
                            TextSpan(
                              text: '.${parts[1]}%',
                              style: AppTypography.sectionTitle
                                  .copyWith(color: AppPalette.greyText),
                            )
                          ]
                        : null,
                  ),
                ),
              ),
              Parameter(
                title: "Текущая стоимость",
                value: Text(
                  "+ ${company.currentPrice} ${Strings.rurSymbol}",
                  style: AppTypography.sectionTitle,
                ),
              ),
              Parameter(
                title: "Рекомендация",
                value: Text(
                  company.recomendation,
                  style: AppTypography.sectionTitle,
                ),
              ),
              Parameter(
                title: "Cектор",
                value: Text(
                  company.sector,
                  style: AppTypography.sectionTitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Parameter extends StatelessWidget {
  final String title;
  final Widget value;

  const Parameter({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(
            height: 8,
          ),
          value,
        ],
      );
}
