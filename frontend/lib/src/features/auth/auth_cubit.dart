import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/repository/repository.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required AuthRepository repository})
      : _repository = repository,
        super(const AuthState.success());

  final AuthRepository _repository;

  Future<String?> enterToApp({
    required String email,
    required String password,
  }) async {
    // emit(const AuthState.loading());
    // final result = await _repository.login(email: email, password: password);
    // final value = result.value;
    // if (result.succeed && value != null) {
    //   emit(const AuthState.success());
    //   return value;
    // } else {
    //   final result = await _repository.signUp(email: email, password: password);
    //   final value = result.value;
    //   if (result.succeed && value != null) {
    //     emit(const AuthState.success());
    //     return value;
    //   }
    //   emit(const AuthState.error());
    //   return null;
    // }
    _repository.signUp(email: email, password: password);
  }
}
