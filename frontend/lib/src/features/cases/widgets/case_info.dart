import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';

import '../../../common/theme/border_radius/border_radius.dart';
import '../../../widgets/info_card.dart';

class CaseInfo extends StatelessWidget {
  final double rewardAmount = 500.34;

  const CaseInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parts = rewardAmount.toString().split('.');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(largeRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CurrencyBlock(),
              const SizedBox(
                width: 16,
              ),
              const Text(
                'Портфель\n«Недвижимость»',
                style: AppTypography.caseTitle,
              ),
              Expanded(
                child: Container(
                  height: 10,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppPalette.greyBg,
                  foregroundColor: AppPalette.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded edgesr
                  ),
                ),
                child: const Text(
                  "Пополнить счет",
                  style: AppTypography.sectionTitle,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 34,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Parameter(
                title: "Доходность за неделю",
                value: RichText(
                  text: TextSpan(
                    text: '+ ${rewardAmount.truncate()}',
                    style: AppTypography.sectionTitle,
                    children: parts.length > 1
                        ? [
                            TextSpan(
                              text: '.${parts[1]}',
                              style: AppTypography.sectionTitle
                                  .copyWith(color: AppPalette.greyText),
                            )
                          ]
                        : null,
                  ),
                ),
              ),
              SizedBox(
                width: 36,
              ),
              const Parameter(
                title: "Cчёт портфеля",
                value: Text(
                  "+ 12000",
                  style: AppTypography.sectionTitle,
                ),
              ),
              SizedBox(
                width: 36,
              ),
              const Parameter(
                title: "Сектор",
                value: Text(
                  "Недвижимость",
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
