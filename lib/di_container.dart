import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watertankclening/data/datasource/remote/dio/dio_client.dart';
import 'package:watertankclening/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:watertankclening/data/repository/splash_repo.dart';
import 'package:watertankclening/helper/preferenceutils.dart';
import 'package:watertankclening/provider/auth_provider.dart';
import 'package:watertankclening/provider/otp_provider.dart';
import 'package:watertankclening/provider/splash_provider.dart';
import 'package:watertankclening/provider/theme_provider.dart';
import 'package:watertankclening/utill/app_constants.dart';

import 'data/repository/auth_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl()));
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(),sharedPreferences: sl()));

  // Provider
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => OTPProvider());
  sl.registerFactory(() => AuthProvider(authRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  PreferenceUtils.init();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}