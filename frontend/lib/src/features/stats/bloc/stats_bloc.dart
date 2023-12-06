import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_event.dart';

part 'stats_state.dart';

part 'stats_bloc.freezed.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc() : super(const _Loading()) {
    on<_News>(_newsTap);
    on<_Case>(_caseTap);
    on<_Fetch>(_fetch);
  }

  Future<void> _caseTap(_Case event, Emitter<StatsState> emit) async {}

  Future<void> _newsTap(_News event, Emitter<StatsState> emit) async {}

  Future<void> _fetch(_Fetch event, Emitter<StatsState> emit) async {}
}
