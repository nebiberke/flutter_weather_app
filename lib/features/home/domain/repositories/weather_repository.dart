import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/home/domain/entities/api/weather_api_entity.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, WeatherApiEntity>> getWeather({
    required double latitude,
    required double longitude,
  });
}
