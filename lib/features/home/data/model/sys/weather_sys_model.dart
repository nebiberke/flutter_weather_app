import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/home/domain/entities/sys/weather_sys_entity.dart';

part 'weather_sys_model.g.dart';

@JsonSerializable(createToJson: false)
class WeatherSysModel extends Equatable {
  const WeatherSysModel({
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherSysModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherSysModelFromJson(json);

  final int? sunrise;
  final int? sunset;

  WeatherSysEntity toEntity() {
    return WeatherSysEntity(
      sunrise: sunrise ?? WeatherSysEntity.initial().sunrise,
      sunset: sunset ?? WeatherSysEntity.initial().sunset,
    );
  }

  @override
  List<Object?> get props => [sunrise, sunset];
}
