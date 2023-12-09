import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';

class SearchInput extends StatelessWidget {
  final Future<void> Function(String) onSearch;

  const SearchInput({
    required this.onSearch,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 472,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppPalette.greyBg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        onSubmitted: (value) => onSearch(value),
        decoration: InputDecoration(
          hintText: 'Поиск по компаниям',
          hintStyle:
              AppTypography.regularBlack.copyWith(color: AppPalette.greyText),
          border: InputBorder.none,
          suffixIcon: const Icon(
            Icons.search,
            color: AppPalette.greyText,
          ),
        ),
      ),
    );
  }
}
