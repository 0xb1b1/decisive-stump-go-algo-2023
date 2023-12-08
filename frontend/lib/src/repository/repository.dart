import 'dart:convert';

import 'package:bcrypt/bcrypt.dart';
import 'package:built_value/json_object.dart';
import 'package:frontend/src/repository/client_result.dart';

import '../api/auth_api.dart';

class AuthRepository {
  final AuthApi _authApi;

  AuthRepository({required AuthApi authApi}) : _authApi = authApi;

  Future<ClientResult<String>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
      final response = await _authApi.signUp(email: email, password: hashed);
      // userSignupSchema: UserSignupSchema(
      //   (b) => {
      //     b.email = jsonDecode(email),
      //     b.passwordHash = jsonDecode(hashed),
      //     b.firstName = jsonDecode('dsdsd'),
      //     b.lastName = jsonDecode('dsdsd'),
      //   },
      // ),
      // );
      final data = response.data;
      if (data == null) {
        return ClientResult.failed(Exception());
      } else {
        return ClientResult.succeed(data);
      }
    } catch (e, s) {
      return ClientResult.failed(e, s);
    }
  }

  Future<ClientResult<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
      final response = await _authApi.login(email: email, password: hashed);
      final data = response.data;
      if (data == null) {
        return ClientResult.failed(Exception());
      } else {
        return ClientResult.succeed(data);
      }
    } catch (e, s) {
      return ClientResult.failed(e, s);
    }
  }
}
