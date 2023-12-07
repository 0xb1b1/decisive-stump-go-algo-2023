# app_api.api.AuthenticationApi

## Load the API package
```dart
import 'package:app_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**loginAuthLoginPost**](AuthenticationApi.md#loginauthloginpost) | **POST** /auth/login | Login
[**signupAuthSignupPost**](AuthenticationApi.md#signupauthsignuppost) | **POST** /auth/signup | Signup
[**userAuthMeGet**](AuthenticationApi.md#userauthmeget) | **GET** /auth/me | User


# **loginAuthLoginPost**
> TokenSchema loginAuthLoginPost(userLoginSchema)

Login

### Example
```dart
import 'package:app_api/api.dart';

final api = AppApi().getAuthenticationApi();
final UserLoginSchema userLoginSchema = ; // UserLoginSchema | 

try {
    final response = api.loginAuthLoginPost(userLoginSchema);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthenticationApi->loginAuthLoginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userLoginSchema** | [**UserLoginSchema**](UserLoginSchema.md)|  | 

### Return type

[**TokenSchema**](TokenSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **signupAuthSignupPost**
> TokenSchema signupAuthSignupPost(userSignupSchema)

Signup

### Example
```dart
import 'package:app_api/api.dart';

final api = AppApi().getAuthenticationApi();
final UserSignupSchema userSignupSchema = ; // UserSignupSchema | 

try {
    final response = api.signupAuthSignupPost(userSignupSchema);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthenticationApi->signupAuthSignupPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userSignupSchema** | [**UserSignupSchema**](UserSignupSchema.md)|  | 

### Return type

[**TokenSchema**](TokenSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userAuthMeGet**
> JsonObject userAuthMeGet()

User

### Example
```dart
import 'package:app_api/api.dart';
// TODO Configure HTTP basic authorization: JwtAccessBearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('JwtAccessBearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('JwtAccessBearer').password = 'YOUR_PASSWORD';

final api = AppApi().getAuthenticationApi();

try {
    final response = api.userAuthMeGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthenticationApi->userAuthMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[JwtAccessBearer](../README.md#JwtAccessBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

