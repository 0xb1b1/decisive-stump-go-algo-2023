import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';

import 'colors/app_colors_extension.dart';

class AppTheme {
  static final defaultTheme = () {
    final sourceTheme = ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.mainBlue),
    );

    return sourceTheme.copyWith(
        cardTheme: const CardTheme(color: AppPalette.white),
        textTheme: sourceTheme.textTheme.copyWith(
          bodyMedium: AppTypography.regularBlack,
        ),
        extensions: [_defaultColors],
        navigationDrawerTheme: NavigationDrawerThemeData(
          shadowColor: Colors.white,
          labelTextStyle: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return AppTypography.selectedTile;
              }
              return AppTypography.unselectedTile;
            },
          ),
          tileHeight: 40,
          backgroundColor: AppPalette.mainBlue,
          indicatorColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: AppPalette.greyBg);
  }();

  static final _defaultColors = AppColorsExtension(
    mainBlue: AppPalette.mainBlue,
    minorBlue: AppPalette.minorBlue,
    tableHeader: AppPalette.lightBlue,
    white: AppPalette.white,
    black: AppPalette.black,
    greyText: AppPalette.greyText,
    background: AppPalette.greyBg,
    selectedTile: AppPalette.white,
    deselectedTile: AppPalette.white700,
    onSurface: Colors.black,
  );
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._defaultColors;
}

extension ThemeGetter on BuildContext {
  /// Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
