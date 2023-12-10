import 'package:flutter/material.dart';

class NewCasePage extends StatelessWidget {
  const NewCasePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 36,
        ),
        child: Center(
          child: Text("Cases Page"),
        ),
      ),
    );
  }
}
