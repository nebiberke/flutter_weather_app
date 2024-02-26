import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/home/domain/entities/api/weather_api_entity.dart';
import 'package:weather_app/features/home/domain/repositories/weather_repository.dart';

class UCGetWeather {
  UCGetWeather({required WeatherRepository repository})
      : _repository = repository;

  final WeatherRepository _repository;

  Future<Either<Failure, WeatherApiEntity>> call({
    required double latitude,
    required double longitude,
  }) {
    return _repository.getWeather(latitude: latitude, longitude: longitude);
  }
}
