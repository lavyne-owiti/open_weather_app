import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_weather_app/feature/weather/domain/usecases/get_forecast.dart';
import 'package:new_weather_app/feature/weather/presentation/providers/weather_state.dart';
import '../../domain/usecases/get_weather.dart';

class WeatherNotifier extends StateNotifier<WeatherState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetForecastUseCase getForecastUseCase;

  WeatherNotifier({
    required this.getCurrentWeatherUseCase,
    required this.getForecastUseCase,
  }) : super(WeatherState());

  Future<void> fetchCurrentWeather(String cityName) async {
    state = state.copyWith(isLoading: true);
    final result = await getCurrentWeatherUseCase.execute(cityName);
    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (weather) {
        state = state.copyWith(isLoading: false, currentWeather: weather);
      },
    );
  }

  Future<void> fetchForecast(String cityName) async {
    state = state.copyWith(isLoading: true);
    final result = await getForecastUseCase.execute(cityName);
    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (forecast) {
        state = state.copyWith(isLoading: false, forecast: forecast);
      },
    );
  }
}

final weatherNotifierProvider = StateNotifierProvider<WeatherNotifier, WeatherState>(
  (ref ) {
    final getCurrentWeatherUseCase = ref.watch(getCurrentWeatherUseCaseProvider);
    final getForecastUseCase = ref.watch(getForecastUseCaseProvider);
    return WeatherNotifier(
      getCurrentWeatherUseCase: getCurrentWeatherUseCase,
      getForecastUseCase: getForecastUseCase,
    );
  }
);


