import 'package:flutter_bloc/flutter_bloc.dart';

enum CurrentPageState {
  stats,
  cases,
}

class CurrentPageCubit extends Cubit<CurrentPageState> {
  CurrentPageCubit() : super(CurrentPageState.stats);

  void changePage(CurrentPageState page) => emit(page);
}
