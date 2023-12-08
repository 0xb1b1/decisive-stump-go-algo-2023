import 'package:flutter/material.dart';

import '../../../../common/theme/border_radius/border_radius.dart';
import '../../../../common/theme/colors/app_palette.dart';

class CaseStats extends StatelessWidget {
  const CaseStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(largeRadius),
      ),
    );
  }
}
