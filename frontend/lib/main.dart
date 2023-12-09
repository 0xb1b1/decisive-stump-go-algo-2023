import 'package:flutter/material.dart';
import 'package:frontend/src/common/di/service_locator.dart';
import 'package:frontend/src/common/theme/theme.dart';
import 'package:frontend/src/features/auth/auth_page.dart';
import 'package:frontend/src/features/current_page/current_page.dart';

void main() {
  final locator = ServiceLocator();
  locator.setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOEX Trading',
      theme: AppTheme.defaultTheme,
      home: const AuthPage(),
    );
  }
}
