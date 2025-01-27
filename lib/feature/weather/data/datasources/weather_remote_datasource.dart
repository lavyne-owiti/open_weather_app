import 'package:new_weather_app/feature/weather/domain/entities/weather.dart';

import '../../../../core/dio/dio.dart';
import '../../../../core/utils/constants.dart';
import '../models/weather_model.dart';

class WeatherRemoteDataSource {
  final DioClient dioClient;

  WeatherRemoteDataSource({required this.dioClient});

  Future<Map<String, dynamic>> getCurrentWeather(String city) async {
    try {
      final response = await dioClient.get(
        "weather",
        queryParameters: {
          'q': city,
          'appid': Constants.apiKey,
          'units': 'metric',
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to load current weather data $e');
    }
  }



  Future<List> getForecast(String city) async {
    try {
      final response = await dioClient.get(
        "forecast",
        queryParameters: {
          'q': city,
          'appid': Constants.apiKey,
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
