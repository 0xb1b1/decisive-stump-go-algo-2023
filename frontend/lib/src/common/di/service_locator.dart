import 'package:dio/dio.dart';
import 'package:frontend/src/api/app_api.dart';
import 'package:frontend/src/features/stats/cubit/stats_cubit.dart';
import 'package:frontend/src/repository/app_repository.dart';
import 'package:frontend/src/repository/repository.dart';
import 'package:get_it/get_it.dart';

import '../../api/auth_api.dart';
import '../../features/auth/auth_cubit.dart';

class ServiceLocator {
  ServiceLocator();

  final _getIt = GetIt.instance;

  void setupDependencies() {
    final dio = Dio();
    dio.options
      ..contentType = 'application/json'
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);

    final authRepository = AuthRepository(
      authApi: AuthApi(dio),
    );
    final appRepository = AppRepository(AppApi(dio));
    final authManager = AuthCubit(repository: authRepository);
    final statCubit = StatsCubit(repository: appRepository);
    // dio.interceptors.add(DioTokenInterceptor());
    _getIt.registerSingleton<Dio>(dio);
    _getIt.registerSingleton<AuthCubit>(authManager);
    _getIt.registerSingleton<StatsCubit>(statCubit);
    // _getIt.registerSingleton<AuthRepository>(authRepository);
  }

  void configureToken(String token) {}
}
