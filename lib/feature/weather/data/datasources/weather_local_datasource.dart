import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/weather.dart';
import '../models/weather_model.dart';

class WeatherLocalDataSource {
  final Box<WeatherModel> weatherBox;

  WeatherLocalDataSource({required this.weatherBox});

  bool isWeatherDataCached(String cityName) {
    return weatherBox.containsKey(cityName);
  }


  // Saving current weather data 
  Future<void> saveCurrentWeather(WeatherModel weather) async {
    try {
      await weatherBox.put(weather.cityName, weather); 
    } catch (e) {
      throw Exception('Failed to save weather data: $e');
    }
  }

  // Retrieving the weather data 
  Future<WeatherModel?> getCurrentWeather(String cityName) async {
    try {
      return weatherBox.get(cityName); 
    } catch (e) {
      throw Exception('Failed to retrieve weather data: $e');
    }
  }

  // Saving the weather forecast 
  Future<void> saveForecast(List<WeatherEntity> forecast) async {
    try {
      for (var weather in forecast) {
        if(weather is WeatherModel){
          await weatherBox.put(weather.cityName, weather);
        }else {
          throw Exception('Failed to save forecast data');
        }
      }
    } catch (e) {
      throw Exception('Failed to save forecast data: $e');
    }
  }

  // Retrieving the weather forecast   
  Future<List<WeatherEntity>> getForecast(String cityName) async {
    try {
      final forecast = weatherBox.values
          .where((weather) => weather.cityName == cityName)
          .toList();
      return forecast;
    } catch (e) {
      throw Exception('Failed to retrieve forecast data: $e');
    }
  }


}


final weatherLocalDataSourceProvider = Provider<WeatherLocalDataSource>((ref) {
  return WeatherLocalDataSource(weatherBox: ); 
}); 