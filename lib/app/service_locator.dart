import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:live_soccer/data/data_source/remote_data_source.dart';
import 'package:live_soccer/data/models/network_models.dart';
import 'package:live_soccer/data/network/app_service.dart';
import 'package:live_soccer/data/network/dio_factory.dart';
import 'package:live_soccer/data/network/network_info.dart';
import 'package:live_soccer/data/repository/repository_impl.dart';
import 'package:live_soccer/domain/repositories/reposoitory.dart';
import 'package:live_soccer/domain/usecases/get_countries_usecase.dart';
import 'package:live_soccer/domain/usecases/get_match_events_usecase.dart';
import 'package:live_soccer/domain/usecases/get_matches_usecase.dart';
import 'package:live_soccer/domain/usecases/get_standings_usecase.dart';

import '../domain/usecases/get_leagues_usecase.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // this the module that contains all generic dependencies

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppService>(() => AppService(dio));

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  instance.registerLazySingleton<Respository>(
      () => RepositoryImpl(instance(), instance()));

  instance.registerFactory<GetCountriesUseCase>(
      () => GetCountriesUseCase(instance()));

  instance.registerFactory<GetCompetionsUseCase>(
      () => GetCompetionsUseCase(instance()));

  instance
      .registerFactory<GetMatchesUsecase>(() => GetMatchesUsecase(instance()));

  instance.registerFactory<GetMatchEventsUsecase>(
      () => GetMatchEventsUsecase(instance()));
  instance.registerFactory<GetStandingsUsecase>(
      () => GetStandingsUsecase(instance()));
}

Future<void> initCountriesModule() async {
  // this the module that contains all generic dependencies
  if (!GetIt.I.isRegistered<GetCountriesUseCase>()) {
    instance.registerFactory<GetCountriesUseCase>(
        () => GetCountriesUseCase(instance()));
  }
}
