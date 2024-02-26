import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/home/data/model/main/weather_main_model.dart';
import 'package:weather_app/features/home/data/model/sys/weather_sys_model.dart';
import 'package:weather_app/features/home/data/model/weather/weather_model.dart';
import 'package:weather_app/features/home/domain/entities/api/weather_api_entity.dart';

part 'weather_api_model.g.dart';

@JsonSerializable(createToJson: false)
class WeatherApiModel extends Equatable {
  const WeatherApiModel({
    required this.weather,
    required this.main,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
  });

  factory WeatherApiModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiModelFromJson(json);
  final List<WeatherModel>? weather;
  final WeatherMainModel? main;
  final int? dt;
  final WeatherSysModel? sys;
  final int? timezone;
  final int? id;
  final String? name;

  WeatherApiEntity toEntity() {
    return WeatherApiEntity(
      weather: weather?.map((e) => e.toEntity()).toList() ??
          WeatherApiEntity.initial().weather,
      main: main?.toEntity() ?? WeatherApiEntity.initial().main,
      dt: dt ?? WeatherApiEntity.initial().dt,
      sys: sys?.toEntity() ?? WeatherApiEntity.initial().sys,
      timezone: timezone ?? WeatherApiEntity.initial().timezone,
      id: id ?? WeatherApiEntity.initial().id,
      name: name ?? WeatherApiEntity.initial().name,
    );
  }

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
