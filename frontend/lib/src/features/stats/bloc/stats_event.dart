part of 'stats_bloc.dart';

@freezed
class StatsEvent with _$StatsEvent {
  const factory StatsEvent.fetch() = _Fetch;

  const factory StatsEvent.newsTap({
    required String url,
  }) = _News;

  const factory StatsEvent.caseTap({
    required String id,
  }) = _Case;
}
