import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  AppBarCubit()
      : super(
          const AppBarState.data(
            account: 500000,
            assets: 453594,
          ),
        );

  void increaseAccount(double sum) {
    final currentSum = state.account;
    emit(state.copyWith(account: currentSum + sum));
  }

  void decreaseAccount(double sum) {
    final currentSum = state.account;
    //TODO проверки на отрицательность
    emit(state.copyWith(account: currentSum - sum));
  }
}
