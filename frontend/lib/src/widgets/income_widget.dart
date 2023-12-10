import 'package:flutter/material.dart';
import 'package:frontend/src/common/strings.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import '../common/theme/border_radius/border_radius.dart';
import '../common/theme/text/app_typography.dart';

class IncomeWidget extends StatelessWidget {
  final String title;
  final VoidCallback onButtonTap;
  final String buttonTitle;
  final double income;
  final bool isColored;

  const IncomeWidget(
      {required this.title,
      required this.onButtonTap,
      required this.buttonTitle,
      required this.income,
      required this.isColored,
      super.key});

  @override
  Widget build(BuildContext context) {
    final parts = income.toString().split('.');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(largeRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          isColored
              ? Text(
                  formatIncome(income),
                  style: TextStyle(
                    color: (income > 0) ? AppPalette.green : AppPalette.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : RichText(
                  text: TextSpan(
                    text: parts[0],
                    style: AppTypography.rewardBig
                        .copyWith(color: AppPalette.black),
                    children: parts.length > 1
                        ? [
                            TextSpan(
                              text: '.${parts[1]}',
                              style: AppTypography.rewardBig
                                  .copyWith(color: AppPalette.greyText),
                            ),
                            TextSpan(
                              text: ' ${Strings.rurSymbol}',
                              style: AppTypography.rewardBig
                                  .copyWith(color: AppPalette.black),
                            ),
                          ]
                        : null,
                  ),
                ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: onButtonTap,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppPalette.greyBg,
              foregroundColor: AppPalette.black,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              buttonTitle,
              style: AppTypography.sectionTitle,
            ),
          ),
        ],
      ),
    );
  }

  String formatIncome(double income) {
    if (income > 0) {
      return '+$income ${Strings.rurSymbol}';
    }
    return '-$income ${Strings.rurSymbol}';
  }
}
