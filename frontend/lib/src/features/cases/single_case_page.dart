import 'package:flutter/material.dart';
import 'package:frontend/src/features/cases/widgets/case_info.dart';

class SingleCasePage extends StatelessWidget {
  const SingleCasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 36,
        ),
        child: ListView(
          children: [
            CaseInfo(),
          ],
        ),
      ),
    );
  }
}
