import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_weather_app/feature/weather/domain/entities/weather.dart';

import '../../../../core/network/dio.dart';
import '../../../../core/utils/constants.dart';
import '../models/weather_model.dart';

class WeatherRemoteDataSource {
  final DioClient dioClient;

  WeatherRemoteDataSource({required this.dioClient});

  Future<WeatherModel> getCurrentWeather(String city) async {
    try {
      final response = await dioClient.get(
        "weather",
        queryParameters: {
          'q': city,
          'appid': Constants().apiKey,
          'units': 'metric',
        },
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load current weather data $e');
    }
  }



  Future<List<WeatherEntity>> getForecast(String city) async {
    try {
      final response = await dioClient.get(
        "forecast",
        queryParameters: {
          'q': city,
          'appid': Constants().apiKey,
          'units': 'metric', 
        },
      );
      List <WeatherEntity> forecast = (response.data['list'] as List)
      .map((e) => WeatherModel.fromJson(e)).toList();

      return forecast;
    } catch (e) {
      throw Exception('Failed to load forecast data $e');
    }
  }
}



// 2. WeatherRemoteDataSource provider
final weatherRemoteDataSourceProvider = Provider<WeatherRemoteDataSource>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return WeatherRemoteDataSource(dioClient: dioClient);
});

