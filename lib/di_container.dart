import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tank_clean_service/data/datasource/remote/dio/dio_client.dart';
import 'package:water_tank_clean_service/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:water_tank_clean_service/data/repository/splash_repo.dart';
import 'package:water_tank_clean_service/helper/preferenceutils.dart';
import 'package:water_tank_clean_service/provider/auth_provider.dart';
import 'package:water_tank_clean_service/provider/localization_provider.dart';
import 'package:water_tank_clean_service/provider/otp_provider.dart';
import 'package:water_tank_clean_service/provider/splash_provider.dart';
import 'package:water_tank_clean_service/provider/theme_provider.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';

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
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl(), dioClient: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  PreferenceUtils.init();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}