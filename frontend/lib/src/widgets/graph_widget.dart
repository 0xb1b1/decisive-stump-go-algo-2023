import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';

import '../common/theme/border_radius/border_radius.dart';
import '../common/theme/colors/app_palette.dart';

class GraphWidget extends StatelessWidget {
  final String title;

  const GraphWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(largeRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.sectionTitle,
          ),
        ],
      ),
    );
  }
}
