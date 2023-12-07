import 'package:test/test.dart';
import 'package:app_api/app_api.dart';


/// tests for AuthenticationApi
void main() {
  final instance = AppApi().getAuthenticationApi();

  group(AuthenticationApi, () {
    // Login
    //
    //Future<TokenSchema> loginAuthLoginPost(UserLoginSchema userLoginSchema) async
    test('test loginAuthLoginPost', () async {
      // TODO
    });

    // Signup
    //
    //Future<TokenSchema> signupAuthSignupPost(UserSignupSchema userSignupSchema) async
    test('test signupAuthSignupPost', () async {
      // TODO
    });

    // User
    //
    //Future<JsonObject> userAuthMeGet() async
    test('test userAuthMeGet', () async {
      // TODO
    });

  });
}
