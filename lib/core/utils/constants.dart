import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static const String baseUrl = "http://api.openweathermap.org/data/2.5/";
  final  apiKey = dotenv.env['API_KEY']; 
}
