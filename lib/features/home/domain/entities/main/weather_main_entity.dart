import 'package:equatable/equatable.dart';

class WeatherMainEntity extends Equatable {
  const WeatherMainEntity({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  factory WeatherMainEntity.initial() => const WeatherMainEntity(
        temp: 0,
        tempMin: 0,
        tempMax: 0,
      );

  final double temp;
  final double tempMin;
  final double tempMax;

  @override
  List<Object?> get props => [
        temp,
        tempMin,
        tempMax,
      ];
}
