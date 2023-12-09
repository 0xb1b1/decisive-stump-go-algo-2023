import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../api/models/company_info.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.loading() = _Loading;


  const factory SearchState.data({
    required CompanyInfo companies,
  }) = _Data;

  const factory SearchState.unknown() = _Unknown;
}
