import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';

class AppTypography {
  AppTypography._();

  static const _fontFamily = 'FavoritPro';

  static const regularBlack = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    color: AppPalette.black,
  );

  static const regularWhite = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    color: AppPalette.white,
  );

  static const sectionTitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: AppPalette.black,
  );

  static const tableTitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: AppPalette.black,
  );

  static const selectedTile = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppPalette.white,
  );

  static TextStyle unselectedTile = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppPalette.white700,
  );

  static const ryrSymbol = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 40,
    color: AppPalette.white,
  );

  static const rewardBig = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 40,
    color: AppPalette.white,
  );
  static TextStyle rewardSmall = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: AppPalette.white500,
  );
}
