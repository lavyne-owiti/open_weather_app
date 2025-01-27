import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_weather_app/feature/weather/presentation/screens/weather_screen.dart';

class PermissionDeniedScreen extends StatelessWidget {
  const PermissionDeniedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Permission Denied'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_off, size: 100),
           const  SizedBox(height: 10),
           const  Text('Oops! Sorry, this app requires your location to operate', style: TextStyle(fontSize: 18), textAlign: TextAlign.center),

           const SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              _requestPermission(context);
            }, 
            child:const Text('Try Again')),
          ],
        ),
      ),
    );
  }
}

void _requestPermission(BuildContext context) async {
  final LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WeatherHomeScreen()));
  }
}