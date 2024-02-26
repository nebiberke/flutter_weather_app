import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/enums/bloc_state.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/home/domain/entities/api/weather_api_entity.dart';
import 'package:weather_app/features/home/domain/usecases/uc_get_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required UCGetWeather getWeather})
      : _getWeather = getWeather,
        super(WeatherState()) {
    on<FetchWeather>(_onFetchWeather);
  }

  final UCGetWeather _getWeather;

  Future<void> _onFetchWeather(
    FetchWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(blocState: BlocState.loading));
    final result = await _getWeather(
      latitude: event.latitude,
      longitude: event.longitude,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(blocState: BlocState.failure, failure: failure),
      ),
      (weather) =>
          emit(state.copyWith(blocState: BlocState.loaded, weather: weather)),
    );
  }
}
