import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';

class SearchInput extends StatefulWidget {
  final Future<void> Function(String) onSearch;

  const SearchInput({
    required this.onSearch,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        controller: _controller,
        onSubmitted: (value) {
          widget.onSearch(value);
          _controller.clear();
        },
        decoration: InputDecoration(
          hintText: 'Поиск по компаниям',
          hintStyle:
              AppTypography.regularBlack.copyWith(color: AppPalette.greyText),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            color: AppPalette.greyText,
            onPressed: () {
              widget.onSearch(_controller.text);
              _controller.clear();
            },
          ),
        ),
      ),
    );
  }
}
