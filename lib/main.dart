import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_weather_app/feature/weather/presentation/screens/weather_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';  
import 'feature/weather/data/models/weather_model.dart';
import 'feature/weather/presentation/screens/permission_denied_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherModelAdapter());
  await Hive.openBox<WeatherModel>('weatherBox');
  LocationPermission permission = await Geolocator.requestPermission();

  runApp( ProviderScope(child: MyApp( permission: permission,)) );
}

class MyApp extends StatelessWidget {
  final LocationPermission permission;

  const MyApp({Key? key, required this.permission}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return const MaterialApp(
        home:  PermissionDeniedScreen(),
      );
    } else {
      return MaterialApp(
        title: 'Weather Forecast',
        theme: ThemeData.light(), 
        home: const WeatherHomeScreen(),
      );
    }
  }
}