import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.mainBlue,
    required this.minorBlue,
    required this.tableHeader,
    required this.white,
    required this.black,
    required this.greyText,
    required this.background,
    required this.selectedTile,
    required this.deselectedTile,
    required this.onSurface,
  });

  final Color mainBlue;
  final Color minorBlue;
  final Color tableHeader;
  final Color white;
  final Color black;
  final Color greyText;
  final Color background;
  final Color selectedTile;
  final Color deselectedTile;
  final Color onSurface;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? error,
    Color? onError,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
  }) {
    return AppColorsExtension(
      mainBlue: primary ?? this.mainBlue,
      minorBlue: onPrimary ?? this.minorBlue,
      tableHeader: secondary ?? this.tableHeader,
      white: onSecondary ?? this.white,
      black: error ?? this.black,
      greyText: onError ?? this.greyText,
      background: background ?? this.background,
      selectedTile: onBackground ?? this.selectedTile,
      deselectedTile: surface ?? this.deselectedTile,
      onSurface: onSurface ?? this.onSurface,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      mainBlue: Color.lerp(mainBlue, other.mainBlue, t)!,
      minorBlue: Color.lerp(minorBlue, other.minorBlue, t)!,
      tableHeader: Color.lerp(tableHeader, other.tableHeader, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      greyText: Color.lerp(greyText, other.greyText, t)!,
      background: Color.lerp(background, other.background, t)!,
      selectedTile: Color.lerp(selectedTile, other.selectedTile, t)!,
      deselectedTile: Color.lerp(deselectedTile, other.deselectedTile, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
    );
  }
}

/// Optional. If you also want to assign colors in the `ColorScheme`.
extension ColorSchemeBuilder on AppColorsExtension {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: mainBlue,
      onPrimary: minorBlue,
      secondary: tableHeader,
      onSecondary: white,
      error: black,
      onError: greyText,
      background: background,
      onBackground: selectedTile,
      surface: deselectedTile,
      onSurface: onSurface,
    );
  }
}
