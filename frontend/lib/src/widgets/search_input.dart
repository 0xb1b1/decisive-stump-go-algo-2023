import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';

class SearchInput extends StatelessWidget {
  final Future<bool> Function(String) onSearch;

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
        onSubmitted: (value) async{
          final isSuccess = await onSearch(value);
          if(!isSuccess){
            showErrorDialog(context);
          }
        },
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

  Future<void> showErrorDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(
              'Понятно',
            ),
          ),
        ],
        content: const Text(
            "Проверьте интернет-соединение и введите тикер компании"),
        title: const Text(
          "Произошла ошибка",
          style: AppTypography.sectionTitle,
        ),
      ),
    );
  }
}
