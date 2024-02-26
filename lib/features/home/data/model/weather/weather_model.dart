import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/home/domain/entities/weather/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable(createToJson: false)
class WeatherModel extends Equatable {
  const WeatherModel({
    required this.id,
    required this.main,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  final int? id;
  final String? main;

  WeatherEntity toEntity() {
    return WeatherEntity(
      id: id ?? WeatherEntity.initial().id,
      main: main ?? WeatherEntity.initial().main,
    );
  }

  @override
  List<Object?> get props => [id, main];
}
