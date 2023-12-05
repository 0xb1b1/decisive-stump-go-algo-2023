import 'package:flutter/material.dart';
import 'package:frontend/src/common/strings.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/theme.dart';
import 'package:frontend/src/features/stats/stat_page.dart';
import 'package:frontend/src/features/transactions/models/transaction.dart';
import 'package:frontend/src/widgets/table/table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.example,
      theme: AppTheme.defaultTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppPalette.mainBlue,
      ),
      backgroundColor: AppPalette.greyBg,
      body: StatPage(),
    );
  }
}
