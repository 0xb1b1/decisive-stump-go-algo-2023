import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final List<AccountCase> cases;
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
  AccountCubit() : super(AccountLoading()) {
    init();
  }

  init() {
    final cases = [
      AccountCase(
        money: 2200,
        name: 'Счет аккаунта',
        numberEnd: 4321,
      ),
      ...List.generate(
        4,
        (i) => AccountCase(
          money: i * 1000,
          name: 'Портфель «Недвижимость $i»',
          numberEnd: i * 1000,
        ),
      ),
    ];

    final cards = [
      AccountCard(name: 'Тинькофф Банк', numberEnd: 1234),
      AccountCard(name: 'Спер Банк', numberEnd: 3224),
    ];

    emit(AccountLoaded(cases: cases, cards: cards));
  }

  onTransfer({required AccountCase from, required AccountCase to, required double amount}) {}

  onWithdraw({required AccountCase from, required AccountCard to, required double amount}) {}
}
