import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_weather_app/feature/weather/domain/usecases/get_forecast.dart';
import 'package:new_weather_app/feature/weather/presentation/providers/weather_state.dart';
import '../../domain/usecases/get_weather.dart';

class WeatherNotifier extends StateNotifier<AsyncValue<WeatherState>> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetForecastUseCase getForecastUseCase;
  final String cityName;

  WeatherNotifier({
    required this.getCurrentWeatherUseCase,
    required this.getForecastUseCase,
    required this.cityName,
  }) : super(const AsyncValue.loading()) {
    fetchCurrentWeather(cityName);
    // fetchForecast(cityName);
  }

  Future<void> fetchCurrentWeather(String cityName) async {
    state = const AsyncValue.loading();
    final result = await getCurrentWeatherUseCase.execute(cityName);
    result.fold( 
      (failure) {
        state = AsyncValue.error( failure, StackTrace.current);
      },
      (weather) {
        state = AsyncValue.data( weather );
      },
    );
  }

  Future<void> fetchForecast(String cityName) async {
    state =const AsyncValue.loading();
    final result = await getForecastUseCase.execute(cityName);
    result.fold(
      (failure) {
        state = AsyncValue.error( failure, StackTrace.current);
      },
      (forecast) {
        state = AsyncValue.data( forecast);
      },
    );
  }
}
final cityNameProvider = StateProvider<String>((ref) => ''); 
final weatherNotifierProvider = StateNotifierProvider<WeatherNotifier,AsyncValue <WeatherState>>(
  (ref ) {
    final getCurrentWeatherUseCase = ref.watch(getCurrentWeatherUseCaseProvider);
    final getForecastUseCase = ref.watch(getForecastUseCaseProvider);
    final cityName = ref.watch(cityNameProvider);
    //    var cityName;
    return WeatherNotifier(
      getCurrentWeatherUseCase: getCurrentWeatherUseCase,
      getForecastUseCase: getForecastUseCase,
      cityName: cityName ,
    );
  }
);


