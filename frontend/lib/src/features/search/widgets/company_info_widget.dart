import 'package:flutter/material.dart';
import 'package:frontend/src/api/models/company_info.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';

import '../../../common/strings.dart';
import '../../../common/theme/border_radius/border_radius.dart';

class CompanyInfoWidget extends StatelessWidget {
  final CompanyInfo company;

  const CompanyInfoWidget({required this.company, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parts = company.prognosisPercentage.toString().split('.');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 33),
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(largeRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                company.name == null ? company.name! : "Название компании",
                overflow: TextOverflow.ellipsis,
                style: AppTypography.caseTitle,
              ),
              Text(
                company.ticker,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              text: '.${parts[1]} %',
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
                  "${company.stockPrice} ${Strings.rurSymbol}",
                  style: AppTypography.sectionTitle,
                ),
              ),
              Parameter(
                title: "Рекомендация",
                value: Text(
                  // company.recommendation.recommendation,
                  'dsdsd',
                  style: AppTypography.sectionTitle,
                ),
              ),
              Parameter(
                title: "Cектор",
                value: Text(
                  (company.sector != null
                      ? company.sector!
                      : "Название сектора"),
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
