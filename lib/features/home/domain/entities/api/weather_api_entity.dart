import 'package:equatable/equatable.dart';
import 'package:weather_app/features/home/domain/entities/main/weather_main_entity.dart';
import 'package:weather_app/features/home/domain/entities/sys/weather_sys_entity.dart';
import 'package:weather_app/features/home/domain/entities/weather/weather_entity.dart';

class WeatherApiEntity extends Equatable {
  const WeatherApiEntity({
    required this.weather,
    required this.main,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
  });

  factory WeatherApiEntity.initial() => WeatherApiEntity(
        weather: const [],
        main: WeatherMainEntity.initial(),
        dt: 0,
        sys: WeatherSysEntity.initial(),
        timezone: 0,
        id: 0,
        name: '',
      );

  final List<WeatherEntity> weather;
  final WeatherMainEntity main;
  final int dt;
  final WeatherSysEntity sys;
  final int timezone;
  final int id;
  final String name;

  @override
  List<Object?> get props => [
        weather,
        main,
        dt,
        sys,
        timezone,
        id,
        name,
      ];
}
