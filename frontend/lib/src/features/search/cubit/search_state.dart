import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../api/models/company_info.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.loading() = _Loading;

  const factory SearchState.error() = _Error;

  const factory SearchState.initial() = _Initial;

  const factory SearchState.data({
    required CompanyInfo companies,
  }) = _Data;
}
