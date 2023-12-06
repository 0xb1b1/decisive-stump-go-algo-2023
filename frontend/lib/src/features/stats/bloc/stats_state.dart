part of 'stats_bloc.dart';

@freezed
class StatsState with _$StatsState {
  const factory StatsState.loading() = _Loading;

  const factory StatsState.error() = _Error;

  const factory StatsState.success() = _Success;
}
