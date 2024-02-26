import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/clients/network/network_client.dart';
import 'package:weather_app/features/home/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/home/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/home/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/home/domain/usecases/uc_get_weather.dart';
import 'package:weather_app/features/home/presentation/bloc/weather_bloc.dart';

abstract final class Locator {
  /// [GetIt] instance
  static final _instance = GetIt.instance;

  /// Returns instance of [WeatherBloc]
  static WeatherBloc get weatherBloc => _instance<WeatherBloc>();

  static void setupLocator({required String baseUrl}) {
    _instance

      // Client Dependencies
      ..registerFactory(Dio.new)

      // Clients
      ..registerLazySingleton(
        () => NetworkClient(dio: _instance(), baseUrl: baseUrl),
      )

      // RemoteDataSource
      ..registerFactory<WeatherRemoteDataSource>(
        () => WeatherRemoteDataSourceImpl(networkClient: _instance()),
      )

      // Repositories
      ..registerFactory<WeatherRepository>(
        () => WeatherRepositoryImpl(remoteDataSource: _instance()),
      )

      // Usecases
      ..registerFactory(() => UCGetWeather(repository: _instance()))

      // Blocs
      ..registerFactory(() => WeatherBloc(getWeather: _instance()));
  }
}
