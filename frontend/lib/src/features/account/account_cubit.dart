import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/api/models/portfolio_wrapper.dart';

import '../../api/models/portfolio_stripped.dart';

abstract class AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final List<PortfolioWrapper> cases;
  final List<AccountCard> cards;

  AccountLoaded({
    required this.cases,
    required this.cards,
  });
}

class AccountCase {
  final String name;
  final int numberEnd;
  final int money;

  AccountCase({
    required this.name,
    required this.numberEnd,
    required this.money,
  });
}

class AccountCard {
  final String name;
  final int numberEnd;

  AccountCard({
    required this.name,
    required this.numberEnd,
  });
}

class AccountCubit extends Cubit<AccountState> {
  final _rnd = Random();
  final List<PortfolioStripped> _cases;

  AccountCubit({required List<PortfolioStripped> cases})
      : _cases = cases,
        super(AccountLoading()) {
    init();
  }

  init() {
    final cases = _cases
        .map(
          (e) => PortfolioWrapper(
            uuid: e.uuid,
            money: _rnd.nextInt(30000) + 10000,
            name: "Портфель «${e.sector}»",
            numberEnd: _rnd.nextInt(9000) + 1000,
          ),
        )
        .toList();
    cases.insert(
      0,
      PortfolioWrapper(
        uuid: 'wc3md2kwlm3',
        money: _rnd.nextInt(30000) + 10000,
        name: "Cчёт аккаунта",
        numberEnd: _rnd.nextInt(9000) + 1000,
      ),
    );

    final cards = [
      AccountCard(name: 'Тинькофф Банк', numberEnd: 1532),
      AccountCard(name: 'Сбер Банк', numberEnd: 3214),
    ];

    emit(AccountLoaded(cases: cases, cards: cards));
  }

  onTransfer(
      {required PortfolioWrapper from,
      required PortfolioWrapper to,
      required double amount}) {}

  onWithdraw(
      {required PortfolioWrapper from,
      required AccountCard to,
      required double amount}) {}
}
