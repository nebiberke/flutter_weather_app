import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/home/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/home/data/model/api/weather_api_model.dart';
import 'package:weather_app/features/home/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/home/domain/entities/api/weather_api_entity.dart';
import 'package:weather_app/features/home/domain/repositories/weather_repository.dart';

class MockWeatherRemoteDataSource extends Mock
    implements WeatherRemoteDataSource {}

void main() {
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepository weatherRepository;

  late double tLatitude;
  late double tLongitude;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepository =
        WeatherRepositoryImpl(remoteDataSource: mockWeatherRemoteDataSource);
    tLatitude = 37.4219983;
    tLongitude = -122.084;
  });

  const tWeatherApiModel = WeatherApiModel(
    weather: [],
    main: null,
    dt: 0,
    sys: null,
    timezone: 0,
    id: 0,
    name: '',
  );
  final tWeatherApiEntity = tWeatherApiModel.toEntity();

  test('Returns Right with WeatherApiEntity when there is no exception',
      () async {
    when(
      () => mockWeatherRemoteDataSource.getWeather(
        latitude: tLatitude,
        longitude: tLongitude,
      ),
    ).thenAnswer((_) async => tWeatherApiModel);

    final result = await weatherRepository.getWeather(
      latitude: tLatitude,
      longitude: tLongitude,
    );

    verify(
      () => mockWeatherRemoteDataSource.getWeather(
        latitude: tLatitude,
        longitude: tLongitude,
      ),
    );

    expect(result, equals(Right<Failure, WeatherApiEntity>(tWeatherApiEntity)));
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(
      () => mockWeatherRemoteDataSource.getWeather(
        latitude: tLatitude,
        longitude: tLongitude,
      ),
    ).thenThrow(Exception());

    final result = await weatherRepository.getWeather(
      latitude: tLatitude,
      longitude: tLongitude,
    );

    verify(
      () => mockWeatherRemoteDataSource.getWeather(
        latitude: tLatitude,
        longitude: tLongitude,
      ),
    );

    expect(
      result,
      isA<Left<Failure, WeatherApiEntity>>(),
    );
  });
}
