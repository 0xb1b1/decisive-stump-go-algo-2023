import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/api/models/portfolio_wrapper.dart';
import 'package:frontend/src/features/account/account_cubit.dart';
import 'package:frontend/src/features/account/transfer_page.dart';
import 'package:frontend/src/features/account/withdraw_page.dart';

class AccountSum extends StatelessWidget {
  const AccountSum({super.key});

  int getSum(List<PortfolioWrapper> cases) {
    int sum = 0;
    for (var i = 0; i < cases.length; i++) {
      sum += cases[i].money;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(builder: (BuildContext context, state) {
      return Container(
        width: 347,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Всего на счетах',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF14161C),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            (state is AccountLoaded)
                ? Text(
                    '${getSum(state.cases)} ₽',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : const CircularProgressIndicator(),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                if (state is AccountLoaded) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WithdrawPage(
                        cases: state.cases,
                        cards: state.cards,
                        onTransfer: BlocProvider.of<AccountCubit>(context).onWithdraw,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                width: 306,
                padding: const EdgeInsets.symmetric(vertical: 14),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF3F4F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Вывести средства',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF14161C),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                if (state is AccountLoaded) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TransferPage(
                        cases: state.cases,
                        onTransfer: BlocProvider.of<AccountCubit>(context).onTransfer,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                width: 306,
                padding: const EdgeInsets.symmetric(vertical: 14),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF3F4F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Переводы между счетами',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF14161C),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
