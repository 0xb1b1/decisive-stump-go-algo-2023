import 'package:dio/dio.dart';
import 'package:frontend/src/api/app_api.dart';
import 'package:frontend/src/common/di/dio_token_interceptor.dart';
import 'package:frontend/src/features/cases/provider/cases_provider.dart';
import 'package:frontend/src/features/current_page/%D1%81ubit/app_bar_cubit.dart';
import 'package:frontend/src/features/search/cubit/search_cubit.dart';
import 'package:frontend/src/features/stats/cubit/stats_cubit.dart';
import 'package:frontend/src/repository/app_repository.dart';
import 'package:frontend/src/repository/auth_repository.dart';
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
    final authManager = AuthCubit(repository: authRepository);
    _getIt.registerSingleton<Dio>(dio);
    _getIt.registerSingleton<AuthCubit>(authManager);
  }

  void configureToken(String token) {
    final dio = Dio();
    dio.options
      ..contentType = 'application/json'
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);
    dio.interceptors.add(DioTokenInterceptor(token: token));
    final appRepository = AppRepository(AppApi(dio));
    final statCubit = StatsCubit(repository: appRepository);
    final searchCubit = SearchCubit(repository: appRepository);
    final casesProvider = CasesProvider();
    final appBarCubit = AppBarCubit();
    _getIt.registerSingleton<AppRepository>(appRepository);
    _getIt.registerSingleton<StatsCubit>(statCubit);
    _getIt.registerSingleton<SearchCubit>(searchCubit);
    _getIt.registerSingleton<CasesProvider>(casesProvider);
    _getIt.registerSingleton(appBarCubit);
  }
}
