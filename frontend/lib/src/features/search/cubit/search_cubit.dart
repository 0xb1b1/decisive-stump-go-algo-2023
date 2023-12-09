import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/search/cubit/search_state.dart';

import '../../../repository/app_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  final AppRepository _repository;

  SearchCubit({required AppRepository repository})
      : _repository = repository,
        super(const SearchState.unknown());

  Future<bool> getCompany(String ticker) async {
    emit(const SearchState.loading());
    final result = await _repository.getCompany(ticker);
    final value = result.value;
    if (result.succeed && value != null) {
      emit(SearchState.data(companies: value));
      return true;
    } else {
      emit(const SearchState.unknown());
      return false;
    }
  }
}
