import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/api/api.dart';
import 'core/api/dio_api.dart';

final getIt = GetIt.instance;

void initialize() {
  // Api
  getIt.registerLazySingleton<Api>(() => DioApi());
  getIt.registerFactory<ApiFormData>(() => DioApiFormData());

  // Data sources
  // getIt.registerLazySingleton<AppLocalDataSource>(
  //     () => HiveAppLocalDataSource());

  // Repositories
  // getIt.registerLazySingleton<AppRepository>(() => AppRepositoryV1(getIt()));

  // Usecases
  // getIt.registerLazySingleton(() => GetListBlogUseCase(getIt()));

  // Cubit
  // getIt.registerFactory(() => IntroCubit(getIt()));

  // Others
  getIt.registerFactory(() => TextEditingController());
  getIt.registerFactory(() => ScrollController());
  getIt.registerFactory(() => GlobalKey<FormState>());
  getIt.registerFactory(() => PageController());
  getIt.registerFactory(() => File(''));

  // External
}
