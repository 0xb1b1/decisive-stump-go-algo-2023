import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';

class TableButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onButtonTap;

  const TableButton({
    required this.isActive,
    required this.title,
    required this.onButtonTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isActive ? onButtonTap : null,
      child: Row(
        children: [
          const Icon(
            Icons.play_circle,
            color: AppPalette.minorBlue,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: AppTypography.regularBlack,
          ),
        ],
      ),
    );
  }
}
