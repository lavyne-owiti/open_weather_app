import 'package:new_weather_app/feature/weather/domain/entities/weather.dart';
import '../../../../core/error/failiures.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
  Future<Either<Failure, List<WeatherEntity>>> getForecast(String cityName);
}