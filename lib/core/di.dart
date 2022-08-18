import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_auth/core/app_prefs.dart';
import 'package:simple_auth/src/data/network/app_api.dart';
import 'package:simple_auth/src/data/network/dio_factory.dart';
import 'package:simple_auth/src/data/repository/auth_repository.dart';
import 'package:simple_auth/src/data/repository/problems_repository.dart';
import 'package:simple_auth/src/presentation/busines_logic/auth/auth_cubit.dart';
import 'package:simple_auth/src/presentation/busines_logic/home/home_cubit.dart';

import '../src/data/network/network_info.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // app prefs
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementer(DataConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //* Repos
  setRepos();

  //* BLOCS
  setBlocs();
}

setBlocs() {
  instance.registerFactory<AuthCubit>(() => AuthCubit());
  instance.registerFactory<HomeCubit>(() => HomeCubit());
}

setRepos() {
  instance.registerLazySingleton<AuthRepository>(() => AuthRepository(instance(), instance()));
  instance.registerLazySingleton<ProblemsRepository>(() => ProblemsRepository(instance(), instance()));
}
