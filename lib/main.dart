import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_weather_app/feature/weather/presentation/screens/weather_screen.dart';

void main() {
  // Hive.initFlutter();
  // Hive.registerAdapter(WeatherAdapter());
  runApp(const ProviderScope(child: MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData.light(), 
      home: const WeatherHomeScreen(),
    );
  }
}