import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/cases/models/company.dart';

import '../models/case.dart';
import 'case_state.dart';

class CaseCubit extends Cubit<CaseState> {
  CaseCubit() : super(const CaseState.loading());

  Future<void> initialFetch(String id) async {
    final companies = List.generate(
      10,
      (index) => Company(
        title: 'недвиж $index',
        income: 239392.23,
        ticker: 'AAAA $index',
        count: 20 + index,
        amountSingle: 1239.03 + index,
        amount: 1239.03 + index,
        currentPrice: 234234.23,
        recomendation: "Покупать",
        sector: "Недвижимость",
        about: 'волвоалафыфа',
      ),
    );
    await Future.delayed(
      const Duration(seconds: 1),
      () {},
    );
    emit(
      CaseState.stats(
        companies: companies,
      ),
    );
  }

  void onEditTap() {
    final companies = state.maybeMap(
      orElse: () => null,
      stats: (data) => data.companies,
    );
    if (companies != null) {
      emit(
        CaseState.editing(
          inCase: companies,
          stopped: [],
          inActive: [],
        ),
      );
    }
  }

  void stopSellFromInCase(List<Company> companiesToStop) {
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

  void makeInactiveFromInCase(List<Company> companiesToInactivate) {
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

  void makeInactiveFromStopped(List<Company> companiesToInactivate) {
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

  void resumeFromStopped(List<Company> companiesToMakeInCase) {
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

  void resumeFromInactive(List<Company> companiesToMakeInCase) {
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
