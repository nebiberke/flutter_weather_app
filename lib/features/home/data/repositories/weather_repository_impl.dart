import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/home/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/home/domain/entities/api/weather_api_entity.dart';
import 'package:weather_app/features/home/domain/repositories/weather_repository.dart';

final class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required WeatherRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final WeatherRemoteDataSource _remoteDataSource;
  @override
  Future<Either<Failure, WeatherApiEntity>> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      // Get weather from remote data source
      final response = await _remoteDataSource.getWeather(
        latitude: latitude,
        longitude: longitude,
      );
      // Converted the response of type Weather to WeatherEntity and returned it
      return Right(response.toEntity());
    } on DioException {
      return left(NetworkFailure());
    } on NullResponseException {
      return left(NullResponseFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(UnknownFailure());
    }
  }
}
