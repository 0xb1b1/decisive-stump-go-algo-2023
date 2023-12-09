import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {}

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountLoading()) {
    init();
  }

  init() {
    emit(AccountLoaded());
  }
}
