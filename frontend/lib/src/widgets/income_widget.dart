import 'package:flutter/material.dart';
import 'package:frontend/src/common/strings.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import '../common/theme/border_radius/border_radius.dart';
import '../common/theme/text/app_typography.dart';
import '../features/account/account_page.dart';

class IncomeWidget extends StatelessWidget {
  final String title;
  final VoidCallback onButtonTap;
  final String buttonTitle;
  final double income;

  const IncomeWidget(
      {required this.title,
      required this.onButtonTap,
      required this.buttonTitle,
      required this.income,
      super.key});

  @override
  Widget build(BuildContext context) {
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
          const Text(
            "500.44 ${Strings.rurSymbol}",
            style: TextStyle(
                color: AppPalette.green,
                fontSize: 40,
                fontWeight: FontWeight.bold),
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
}
