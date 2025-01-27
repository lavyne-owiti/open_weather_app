import '../../domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required String cityName,
    required double temperature,
    required String weatherDescription,
    required double windSpeed,
    required int humidity,
    required DateTime date,
  }) : super(
          cityName: cityName,
          temperature: temperature,
          weatherDescription: weatherDescription,
          windSpeed: windSpeed,
          humidity: humidity,
          date: date,
        );

  // WeatherModel from JSON data
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }

  // convert WeatherModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'main': {
        'temp': temperature,
        'humidity': humidity,
      },
      'weather': [
        {'description': weatherDescription}
      ],
      'wind': {
        'speed': windSpeed,
      },
      'dt': date.millisecondsSinceEpoch ~/ 1000,
    };
  }
}
