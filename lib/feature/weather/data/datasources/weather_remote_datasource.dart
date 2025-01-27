import '../../../../core/network/dio.dart';
import '../../../../core/utils/constants.dart';

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
          'units': 'metric', // For Celsius
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Map<String, dynamic>> getForecast(String city) async {
    try {
      final response = await dioClient.get(
        "forecast",
        queryParameters: {
          'q': city,
          'appid': Constants.apiKey,
          'units': 'metric', // For Celsius
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to load forecast data');
    }
  }
}
