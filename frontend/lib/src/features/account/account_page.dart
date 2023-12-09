import 'package:flutter/material.dart';
import 'package:frontend/src/features/account/widgets/account_sum.dart';
import 'package:frontend/src/features/account/widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 36,
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (c, i) {
                    return AccountWidget(
                      money: i * 1000,
                      name: 'Счет аккаунта $i',
                      numberEnd: i * 1000,
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Column(
                children: [
                  const AccountSum(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
