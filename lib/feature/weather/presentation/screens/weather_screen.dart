import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_weather_app/feature/weather/presentation/providers/weather_provider.dart';
import 'package:new_weather_app/feature/weather/presentation/widgets/forecast_list_widget.dart';
import 'package:new_weather_app/feature/weather/presentation/widgets/weather_card_widget.dart';

class WeatherHomeScreen extends ConsumerStatefulWidget {
  const WeatherHomeScreen({Key? key}) : super(key: key);

  @override
  _WeatherHomeScreenState createState() => _WeatherHomeScreenState();

}

class _WeatherHomeScreenState extends ConsumerState<WeatherHomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';

  @override
  Widget build(BuildContext context) {
    
   final weatherState  = ref.watch( weatherNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: 'Search city',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onSubmitted: (text) {
                if (text.isNotEmpty) {
                  // ref.read(weatherNotifierProvider.notifier).fetchWeather(text);
                }
              },
            ),
            const SizedBox(height: 20),

             weatherState.when(
              data: (weatherData) {
                return Column(
                  children: [
                    // WeatherCardWidget displaying current weather
                    WeatherCardWidget(
                      temperature: '${weatherData.temperature}°C',
                      weatherCondition: weatherData.weatherDescription,
                      location: weatherData.cityName,
                    ),
                    const SizedBox(height: 20),
                    // ForecastListWidget displaying 5-day forecast
                    ForecastListWidget(forecastData: weatherData.forecast),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Error: $error')),
            )
          ],
        ),
      ),
    );
  }

}


