import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/company.dart';

part 'case_state.freezed.dart';

@freezed
class CaseState with _$CaseState {
  const factory CaseState.loading() = _Loading;

  const factory CaseState.stats({
    required List<Company> companies,
  }) = _Stats;

  const factory CaseState.editing({
    required List<Company> inCase,
    required List<Company> stopped,
    required List<Company> inActive,
  }) = _Editing;
}
