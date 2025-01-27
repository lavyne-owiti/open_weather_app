import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_weather_app/feature/weather/presentation/widgets/forecast_list_widget.dart';
import 'package:new_weather_app/feature/weather/presentation/widgets/weather_card_widget.dart';

class WeatherHomeScreen extends ConsumerWidget {
  const WeatherHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    
   final weatherState  = watch(weatherProvider);
    
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
              decoration: InputDecoration(
                hintText: 'Search city',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            const WeatherCardWidget (
              temperature: '26°C',
              weatherCondition: 'Sunny',
              location: 'Nairobi',
            ),
            const SizedBox(height: 20),
            ForecastListWidget(forecastData: forecastData),
          ],
        ),
      ),
    );
  }

}
