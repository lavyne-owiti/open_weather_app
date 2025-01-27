import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForecastListWidget extends StatelessWidget {
  final List<Map<String, String>> forecastData;

  const ForecastListWidget({Key? key, required this.forecastData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: forecastData.length,
        itemBuilder: (context, index) {
          final forecast = forecastData[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.cloudRain, // Replace with dynamic icon
                    color: Colors.blue,
                  ),
                  Text(forecast['day']!),
                  Text(forecast['temperature']!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
