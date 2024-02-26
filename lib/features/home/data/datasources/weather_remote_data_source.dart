import 'package:dio/dio.dart';
import 'package:weather_app/app/constants/endpoint_constants.dart';
import 'package:weather_app/app/env/env.dart';
import 'package:weather_app/core/clients/network/network_client.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/features/home/data/model/api/weather_api_model.dart';

abstract interface class WeatherRemoteDataSource {
  Future<WeatherApiModel> getWeather({
    required double latitude,
    required double longitude,
  });
}

final class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  final NetworkClient _networkClient;
  @override
  Future<WeatherApiModel> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _networkClient.get<Map<String, dynamic>>(
        EndpointConstants.weather,
        queryParameters: {
          'lat': latitude.toString(),
          'lon': longitude.toString(),
          'appid': Env.apiKey,
          'units': 'metric',
        },
      );
      // If response is null or data is null, throw [NullResponseException]
      if (response.data == null) {
        throw NullResponseException();
      }
      return WeatherApiModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
    } catch (_) {
      throw UnknownException();
    }
  }
}
