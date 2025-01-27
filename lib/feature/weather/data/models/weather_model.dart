import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/entities/weather.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 0)
class WeatherModel extends WeatherEntity {

   @HiveField(0)
  final String cityName;

  @HiveField(1)
  final double temperature;

  @HiveField(2)
  final String weatherDescription;

  @HiveField(3)
  final double windSpeed;

  @HiveField(4)
  final int humidity;

  @HiveField(5)
  final DateTime date;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
    required this.windSpeed,
    required this. humidity,
    required this. date,
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


 

