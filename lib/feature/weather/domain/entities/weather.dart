class WeatherEntity {
  final String cityName;
  final double temperature;
  final String weatherDescription;
  final double windSpeed;
  final int humidity;
  final DateTime date;

  WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
    required this.windSpeed,
    required this.humidity,
    required this.date,
  });
}
