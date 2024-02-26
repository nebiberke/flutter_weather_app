part of 'weather_bloc.dart';

final class WeatherState extends Equatable {
  WeatherState({
    this.blocState = BlocState.initial,
    WeatherApiEntity? weather,
    this.failure,
  }) : weather = weather ?? WeatherApiEntity.initial();

  final BlocState blocState;
  final WeatherApiEntity weather;
  final Failure? failure;

  @override
  List<Object?> get props => [blocState, weather, failure];

  WeatherState copyWith({
    BlocState? blocState,
    WeatherApiEntity? weather,
    Failure? failure,
  }) {
    return WeatherState(
      blocState: blocState ?? this.blocState,
      weather: weather ?? this.weather,
      failure: failure ?? this.failure,
    );
  }
}
