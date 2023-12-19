import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipeai/core/presentation/providers/drawer_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/result_recipe/data/datasources/result_datasource.dart';
import '../../features/result_recipe/data/repository/result_repository.dart';
import '../../features/result_recipe/domain/usecase/result_usecase.dart';
import '../core.dart';
import '../network/network_info.dart';
import '../presentation/providers/core_provider.dart';
import '../presentation/providers/loading_provider.dart';

final locator = GetIt.instance;
Future<void> locatorInit() async {
  //Provider
  locator.registerFactory<LoadingProvider>(() => LoadingProvider());
  locator.registerFactory<CoreProvider>(
      () => CoreProvider(resultQuestation: locator()));
  locator.registerFactory<DrawerProvider>(() => DrawerProvider());
  //Datasource
  locator.registerLazySingleton<ResultDatasource>(
      () => ResultDataSourceImplementation(dio: locator<Dio>()));
  //Repository
  locator.registerLazySingleton<ResultRepository>(
    () => ResultRepositorImplementation(
      dataSource: locator(),
      networkInfo: locator(),
    ),
  );
  //UseCase
  locator.registerLazySingleton<ResultQuestation>(
      () => ResultQuestation(locator()));
  //NetworkInfo
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(locator<Connectivity>()));
  //Exsternal
  locator.registerLazySingleton<Dio>(() => DioClient().dio);
  locator.registerLazySingleton<Connectivity>(() => Connectivity());
  locator.registerLazySingletonAsync<Session>(() async =>
      SessionHelper(pref: await locator.getAsync<SharedPreferences>()));
  locator.registerLazySingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());
  locator.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());
}
