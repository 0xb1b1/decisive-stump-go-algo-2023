import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/features/account/account_page.dart';

import '../../../common/strings.dart';
import '../../../common/theme/border_radius/border_radius.dart';
import '../../../widgets/info_card.dart';
import '../models/case.dart';

class CaseInfo extends StatelessWidget {
  final Case portfolio;

  const CaseInfo({required this.portfolio, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parts = portfolio.weeklyProfitability.toString().split('.');

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CurrencyBlock(),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  'Портфель\n"${portfolio.title}"',
                  style: AppTypography.caseTitle,
                ),
              ),
              Expanded(
                child: Container(
                  height: 10,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AccountPage(),
                  ),
                ),
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
                child: const Flexible(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    Strings.upAccount,
                    style: AppTypography.sectionTitle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 34,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Parameter(
                title: "Доходность за неделю",
                value: RichText(
                  text: TextSpan(
                    text: '+ ${parts[0]} %',
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
              const SizedBox(
                width: 36,
              ),
              Parameter(
                title: "Cчёт портфеля",
                value: Text(
                  "+ ${portfolio.account} ${Strings.rurSymbol}",
                  style: AppTypography.sectionTitle,
                ),
              ),
              const SizedBox(
                width: 36,
              ),
              // const Parameter(
              //   title: "Сектор",
              //   value: Text(
              //     "Недвижимость",
              //     style: AppTypography.sectionTitle,
              //   ),
              // ),
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
