import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_weather_app/feature/weather/data/repositories/weather_repo_impl.dart';
import 'package:new_weather_app/feature/weather/domain/entities/weather.dart';
import '../../../../core/error/failiures.dart';
import '../repositories/weather_repo.dart';

class GetForecastUseCase {
  final WeatherRepository weatherRepository;

  GetForecastUseCase({required this.weatherRepository});

  Future<Either<Failure, List<WeatherEntity>>> execute(String cityName) async {
    return await weatherRepository.getForecast(cityName);
  }
}

final getForecastUseCaseProvider = Provider<GetForecastUseCase>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return GetForecastUseCase(weatherRepository: weatherRepository);
});