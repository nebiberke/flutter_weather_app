import 'package:equatable/equatable.dart';

class WeatherSysEntity extends Equatable {
  const WeatherSysEntity({
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherSysEntity.initial() => const WeatherSysEntity(
        sunrise: 0,
        sunset: 0,
      );

  final int sunrise;
  final int sunset;

  @override
  List<Object?> get props => [
        sunrise,
        sunset,
      ];
}
