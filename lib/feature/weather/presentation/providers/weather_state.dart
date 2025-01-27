import 'package:new_weather_app/feature/weather/domain/entities/weather.dart';

class WeatherState {
  final bool isLoading;
  final WeatherEntity? currentWeather;
  final List<WeatherEntity>? forecast;
  final String? errorMessage;

  WeatherState({
    this.isLoading = false,
    this.currentWeather,
    this.forecast,
    this.errorMessage,
  });

  WeatherState copyWith({
    bool? isLoading,
    WeatherEntity? currentWeather,
    List<WeatherEntity>? forecast,
    String? errorMessage,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      currentWeather: currentWeather ?? this.currentWeather,
      forecast: forecast ?? this.forecast,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
