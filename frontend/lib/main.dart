import 'package:flutter/material.dart';
import 'package:frontend/src/common/strings.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/common/theme/theme.dart';
import 'package:frontend/src/features/cases/case_page.dart';
import 'package:frontend/src/features/cases/models/case.dart';
import 'package:frontend/src/features/current_page/current_page.dart';
import 'package:frontend/src/features/stats/stat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOEX',
      theme: AppTheme.defaultTheme,
      home: const CurrentPage(),
    );
  }
}
