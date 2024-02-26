part of 'weather_bloc.dart';

abstract final class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchWeather extends WeatherEvent {
  FetchWeather({required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;

  @override
  List<Object> get props => [latitude, longitude];
}
