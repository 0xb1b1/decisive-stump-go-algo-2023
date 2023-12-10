import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/repository/auth_repository.dart';

import '../../common/di/service_locator.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required AuthRepository repository})
      : _repository = repository,
        super(const AuthState.success());

  final AuthRepository _repository;

  Future<bool> enterToApp({
    required String email,
    required String password,
  }) async {
    //TODO: remove hack
    email = 'test@gmail.com';
    password = 'qwerty123';

    emit(const AuthState.loading());
    final result = await _repository.signUp(email: email, password: password);
    final value = result.value;
    if (result.succeed && value != null) {
      emit(const AuthState.success());
      final locator = ServiceLocator();
      locator.configureToken(value);
      return true;
    } else {
      final result = await _repository.login(email: email, password: password);
      final value = result.value;
      if (result.succeed && value != null) {
        emit(const AuthState.success());
        final locator = ServiceLocator();
        locator.configureToken(value);
        return true;
      }
    }
    emit(const AuthState.success());
    return false;
  }
}
