import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/padding/padding.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/common/theme/theme.dart';

import '../common/strings.dart';
import '../common/theme/border_radius/border_radius.dart';

class InfoCard extends StatelessWidget {
  final bool isPrimary;
  final String title;
  final double rewardAmount;

  const InfoCard({
    this.isPrimary = false,
    required this.title,
    required this.rewardAmount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    final parts = rewardAmount.toString().split('.');
    final rewardColor = isPrimary ? AppPalette.white : AppPalette.black;
    final rewardFracColor =
        isPrimary ? AppPalette.white500 : AppPalette.black500;

    return Container(
      height: 208,
      width: 346,
      decoration: BoxDecoration(
        color: isPrimary ? appColors.mainBlue : appColors.white,
        borderRadius: BorderRadius.circular(largeRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: mediumPadding,
                top: largePadding,
                bottom: largePadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CurrencyBlock(),
                  Expanded(
                    child: Container(
                      width: 10,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      title,
                      style: isPrimary
                          ? AppTypography.regularWhite
                          : AppTypography.regularBlack,
                    ),
                  ),
                  const SizedBox(
                    height: smallPadding,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '+ ${rewardAmount.truncate()}',
                      style:
                          AppTypography.rewardBig.copyWith(color: rewardColor),
                      children: parts.length > 1
                          ? [
                              TextSpan(
                                text: '.${parts[1]}',
                                style: AppTypography.rewardSmall
                                    .copyWith(color: rewardFracColor),
                              )
                            ]
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            'img/graph.svg',
            colorFilter: ColorFilter.mode(
              isPrimary ? appColors.white : appColors.mainBlue,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}

class CurrencyBlock extends StatelessWidget {
  const CurrencyBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return Container(
      height: 54,
      width: 54,
      // padding: const EdgeInsets.all(smallPadding),
      decoration: BoxDecoration(
        color: appColors.minorBlue,
        borderRadius: BorderRadius.circular(smallRadius),
      ),
      child: const Center(
        child: Text(
          Strings.rurSymbol,
          style: AppTypography.rurSymbol,
        ),
      ),
    );
  }
}
