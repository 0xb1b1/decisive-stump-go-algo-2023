import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/api/models/portfolio_stock.dart';

import '../../../repository/app_repository.dart';
import 'case_state.dart';

class CaseCubit extends Cubit<CaseState> {
  final AppRepository _repository;

  CaseCubit({required AppRepository repository})
      : _repository = repository,
        super(const CaseState.loading());

  Future<void> initialFetch(String uuid) async {
    final response = await _repository.getPortfolio(uuid);
    final value = response.value!;
    final companies = value.stocks;
    emit(
      CaseState.stats(
        portfolio: value,
        companies: companies,
      ),
    );
  }

  void onEditTap() {
    final companies = state.maybeMap(
      orElse: () => null,
      stats: (data) => data.companies,
    );
    final portfolio = state.maybeMap(
      orElse: () => null,
      stats: (data) => data.portfolio,
    );
    if (companies != null && portfolio != null) {
      final stopped = companies.where((element) => element.isPaused).toList();
      final inActive =
          companies.where((element) => element.isDisabled).toList();
      final inCase = companies
          .where((element) => !element.isDisabled && !element.isPaused)
          .toList();
      emit(
        CaseState.editing(
          portfolio: portfolio,
          inCase: inCase,
          stopped: stopped,
          inActive: inActive,
        ),
      );
    }
  }

  void stopSellFromInCase(List<PortfolioStock> companiesToStop) {
    final currentState = state.maybeMap(
      orElse: () => null,
      editing: (data) => data,
    );
    if (currentState != null) {
      final currentStopped = [...currentState.stopped];
      final currentInCase = [...currentState.inCase];
      final targetStopped = currentStopped + companiesToStop;
      final newInCase = currentInCase
          .where((element) => !companiesToStop.contains(element))
          .toList();
      emit(
        currentState.copyWith(
          stopped: targetStopped,
          inCase: newInCase,
        ),
      );
    }
  }

  void makeInactiveFromInCase(List<PortfolioStock> companiesToInactivate) {
    final currentState = state.maybeMap(
      orElse: () => null,
      editing: (data) => data,
    );
    if (currentState != null) {
      final currentInactive = [...currentState.inActive];
      final currentInCase = [...currentState.inCase];
      final targetInactive = currentInactive + companiesToInactivate;
      final newInCase = currentInCase
          .where((element) => !companiesToInactivate.contains(element))
          .toList();
      emit(
        currentState.copyWith(
          inActive: targetInactive,
          inCase: newInCase,
        ),
      );
    }
  }

  void makeInactiveFromStopped(List<PortfolioStock> companiesToInactivate) {
    final currentState = state.maybeMap(
      orElse: () => null,
      editing: (data) => data,
    );
    if (currentState != null) {
      final currentInactive = [...currentState.inActive];
      final currentStopped = [...currentState.stopped];
      final targetInactive = currentInactive + companiesToInactivate;
      final newStopped = currentStopped
          .where((element) => !companiesToInactivate.contains(element))
          .toList();
      emit(
        currentState.copyWith(
          inActive: targetInactive,
          stopped: newStopped,
        ),
      );
    }
  }

  void resumeFromStopped(List<PortfolioStock> companiesToMakeInCase) {
    final currentState = state.maybeMap(
      orElse: () => null,
      editing: (data) => data,
    );
    if (currentState != null) {
      final currentInCase = [...currentState.inCase];
      final currentStopped = [...currentState.stopped];
      final targetInCase = currentInCase + companiesToMakeInCase;
      final newStopped = currentStopped
          .where((element) => !companiesToMakeInCase.contains(element))
          .toList();
      emit(
        currentState.copyWith(
          inCase: targetInCase,
          stopped: newStopped,
        ),
      );
    }
  }

  void resumeFromInactive(List<PortfolioStock> companiesToMakeInCase) {
    final currentState = state.maybeMap(
      orElse: () => null,
      editing: (data) => data,
    );
    if (currentState != null) {
      final currentInCase = [...currentState.inCase];
      final currentInactive = [...currentState.inActive];
      final targetInCase = currentInCase + companiesToMakeInCase;
      final newInactive = currentInactive
          .where((element) => !companiesToMakeInCase.contains(element))
          .toList();
      emit(
        currentState.copyWith(
          inCase: targetInCase,
          inActive: newInactive,
        ),
      );
    }
  }

  void sendCurrentState() {}
}
