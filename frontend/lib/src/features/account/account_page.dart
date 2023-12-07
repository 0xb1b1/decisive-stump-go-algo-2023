import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
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
          child: Text("Account Page"),
        ),
      ),
    );
  }
}
