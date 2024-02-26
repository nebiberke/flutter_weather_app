import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.id,
    required this.main,
  });

  factory WeatherEntity.initial() => const WeatherEntity(
        id: 0,
        main: '',
      );
  final int id;
  final String main;

  @override
  List<Object?> get props => [id, main];
}
