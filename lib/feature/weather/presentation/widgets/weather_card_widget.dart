import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherCardWidget extends StatelessWidget {
  final String temperature;
  final String weatherCondition;
  final String location;

  const WeatherCardWidget({
    Key? key,
    required this.temperature,
    required this.weatherCondition,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
           const Icon(
              FontAwesomeIcons.sun,
              size: 50,
              color: Colors.orange,
            ),
            const SizedBox(height: 10),
            Text(
              temperature,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              weatherCondition,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              location,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
