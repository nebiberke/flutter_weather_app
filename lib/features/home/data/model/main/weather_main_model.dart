import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/home/domain/entities/main/weather_main_entity.dart';

part 'weather_main_model.g.dart';

@JsonSerializable(createToJson: false)
class WeatherMainModel extends Equatable {
  const WeatherMainModel({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  factory WeatherMainModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainModelFromJson(json);

  final double? temp;

  @JsonKey(name: 'temp_min')
  final double? tempMin;

  @JsonKey(name: 'temp_max')
  final double? tempMax;

  WeatherMainEntity toEntity() {
    return WeatherMainEntity(
      temp: temp ?? WeatherMainEntity.initial().temp,
      tempMin: tempMin ?? WeatherMainEntity.initial().tempMin,
      tempMax: tempMax ?? WeatherMainEntity.initial().tempMax,
    );
  }

  @override
  List<Object?> get props => [temp, tempMin, tempMax];
}
