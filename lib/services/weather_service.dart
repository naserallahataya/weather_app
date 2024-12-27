import 'dart:convert';

import 'package:flutter_application_1/wheatherMdole/wheather_model.dart';
import 'package:http/http.dart' as http;

//http://api.weatherapi.com/v1/current.json?key=61006dd44774411f89f72243240910 &q=London&aqi=no

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apikey = "61006dd44774411f89f72243240910 ";
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try {
      Uri url = Uri.parse('$baseUrl/current.json?key=$apikey&q=$cityName');

      http.Response response = await http.get(url);

      Map<String, dynamic> data = await jsonDecode(response.body);
      // ignore: avoid_print
      print(data);

      weatherData = WeatherModel.fromJason(data);
    } catch (e) {
      print(e);
    }

    return weatherData;
  }
}
