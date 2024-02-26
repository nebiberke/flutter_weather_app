import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/enums/bloc_state.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/home/domain/entities/api/weather_api_entity.dart';
import 'package:weather_app/features/home/domain/usecases/uc_get_weather.dart';
import 'package:weather_app/features/home/presentation/bloc/weather_bloc.dart';

class MockUCGetWeather extends Mock implements UCGetWeather {}

class MockWeatherApiEntity extends Mock implements WeatherApiEntity {}

void main() {
  late MockUCGetWeather mockUCGetWeather;
  late MockWeatherApiEntity mockWeatherApiEntity;
  late WeatherBloc weatherBloc;
  const tLatitude = 37.4219983;
  const tLongitude = -122.084;

  setUp(() {
    mockWeatherApiEntity = MockWeatherApiEntity();
    mockUCGetWeather = MockUCGetWeather();
    weatherBloc = WeatherBloc(getWeather: mockUCGetWeather);
  });

  blocTest<WeatherBloc, WeatherState>(
    'FetchWeather event should emit [Loading, Loaded] when data is gotten successfully',
    build: () => weatherBloc,
    setUp: () {
      when(
        () => mockUCGetWeather(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenAnswer(
        (_) async => Right(mockWeatherApiEntity),
      );
    },
    act: (bloc) =>
        bloc.add(FetchWeather(latitude: tLatitude, longitude: tLongitude)),
    expect: () => [
      WeatherState(blocState: BlocState.loading),
      WeatherState(blocState: BlocState.loaded, weather: mockWeatherApiEntity),
    ],
  );

  blocTest<WeatherBloc, WeatherState>(
    'FetchWeather event should emit [Loading, Failure] when getting data fails',
    build: () => weatherBloc,
    setUp: () {
      when(
        () => mockUCGetWeather(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenAnswer(
        (_) async => Left(NetworkFailure()),
      );
    },
    act: (bloc) =>
        bloc.add(FetchWeather(latitude: tLatitude, longitude: tLongitude)),
    expect: () => [
      WeatherState(blocState: BlocState.loading),
      WeatherState(blocState: BlocState.failure, failure: NetworkFailure()),
    ],
  );
}
