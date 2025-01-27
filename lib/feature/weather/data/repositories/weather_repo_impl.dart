import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_weather_app/feature/weather/domain/entities/weather.dart';
import '../../../../core/error/failiures.dart';
import '../../domain/repositories/weather_repo.dart';
import '../datasources/weather_local_datasource.dart';
import '../datasources/weather_remote_datasource.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  final WeatherLocalDataSource weatherLocalDataSource;

  WeatherRepositoryImpl({
    required this.weatherRemoteDataSource,
    required this.weatherLocalDataSource,
  });

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName) async {
    if (weatherLocalDataSource.isWeatherDataCached(cityName)) {
      final weather = await weatherLocalDataSource.getCurrentWeather(cityName);
      if (weather != null) {
        return Right(weather);
      }
    }

    final weatherData = await weatherRemoteDataSource.getCurrentWeather(cityName);
    final weather = WeatherModel.fromJson(weatherData as Map<String, dynamic>);

    await weatherLocalDataSource.saveCurrentWeather(weather);

    return Right(weather);
  } 

  @override
  Future<Either <Failure ,List<WeatherEntity>>> getForecast(String cityName) async {
    final forecastData = await weatherRemoteDataSource.getForecast(cityName);

    await weatherLocalDataSource.saveForecast(forecastData);

    return Right(forecastData);
  }
  

}


final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final weatherRemoteDataSource = ref.read(weatherRemoteDataSourceProvider);
  final weatherLocalDataSource = ref.read(weatherLocalDataSourceProvider);
  return WeatherRepositoryImpl(
    weatherRemoteDataSource: weatherRemoteDataSource,
    weatherLocalDataSource: weatherLocalDataSource,
  );
});
