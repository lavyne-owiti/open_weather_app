import 'package:flutter/material.dart';
import 'package:new_weather_app/feature/weather/presentation/widgets/forecast_list_widget.dart';
import 'package:new_weather_app/feature/weather/presentation/widgets/weather_card_widget.dart';

class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

     final  forecastData = [
      {'day': 'Mon', 'temperature': '22°C'},
      {'day': 'Tue', 'temperature': '23°C'},
      {'day': 'Wed', 'temperature': '21°C'},
      {'day': 'Thu', 'temperature': '25°C'},
      {'day': 'Fri', 'temperature': '20°C'},
    ];
    
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
