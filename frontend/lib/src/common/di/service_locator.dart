import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  ServiceLocator();

  final _getIt = GetIt.instance;

  void setupDependencies() {
    _getIt.registerSingleton<Dio>(Dio());

  }
}
