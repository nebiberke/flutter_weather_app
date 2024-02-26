import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/home/domain/entities/api/weather_api_entity.dart';
import 'package:weather_app/features/home/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/home/domain/usecases/uc_get_weather.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockWeatherApiEntity extends Mock implements WeatherApiEntity {}

void main() {
  late MockWeatherRepository mockWeatherRepository;
  late MockWeatherApiEntity mockWeatherApiEntity;
  late UCGetWeather ucGetWeather;
  late double tLatitude;
  late double tLongitude;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    mockWeatherApiEntity = MockWeatherApiEntity();
    ucGetWeather = UCGetWeather(repository: mockWeatherRepository);
    tLatitude = 37.4219983;
    tLongitude = -122.084;
  });

  test('Returns Right with WeatherApiEntity when there is no exception',
      () async {
    when(
      () => mockWeatherRepository.getWeather(
        latitude: tLatitude,
        longitude: tLongitude,
      ),
    ).thenAnswer((_) async => Right(mockWeatherApiEntity));

    final result = await ucGetWeather(
      latitude: tLatitude,
      longitude: tLongitude,
    );

    verify(() => ucGetWeather(latitude: tLatitude, longitude: tLongitude));
    expect(result, isA<Right<Failure, WeatherApiEntity>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(
      () => mockWeatherRepository.getWeather(
        latitude: tLatitude,
        longitude: tLongitude,
      ),
    ).thenAnswer((_) async => Left(UnknownFailure()));

    final result = await ucGetWeather(
      latitude: tLatitude,
      longitude: tLongitude,
    );

    verify(() => ucGetWeather(latitude: tLatitude, longitude: tLongitude));

    expect(result, isA<Left<Failure, WeatherApiEntity>>());
  });
}
