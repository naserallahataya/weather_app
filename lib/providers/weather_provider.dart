import 'package:flutter/material.dart';
import 'package:flutter_application_1/wheatherMdole/wheather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
  }

  // ignore: unnecessary_getters_setters
  WeatherModel? get weatherData => _weatherData;
}
