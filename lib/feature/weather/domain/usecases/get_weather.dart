import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_weather_app/feature/weather/data/repositories/weather_repo_impl.dart';
import 'package:new_weather_app/feature/weather/domain/entities/weather.dart';
import '../../../../core/error/failiures.dart';
import '../repositories/weather_repo.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase({required this.weatherRepository});

  Future<Either<Failure, WeatherEntity>> execute(String cityName) async {
    return await weatherRepository.getCurrentWeather(cityName);
  }
}

final getCurrentWeatherUseCaseProvider = Provider<GetCurrentWeatherUseCase>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return GetCurrentWeatherUseCase(weatherRepository: weatherRepository);
});