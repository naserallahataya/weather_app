import 'package:flutter/material.dart';

class WeatherModel {
  String date;

  double temp;
  int code;
  double minTemp;
  String wheatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.code,
    required this.minTemp,
    required this.wheatherStateName,
  });

  // WeatherModel.fromJason(dynamic data) {
  //   date = data["location"]["localtime"];
  //   temp = data['current']['temp_c'];
  //   code = data['current']['condition']['code'];
  //   minTemp = data['current']['temp_f'];
  //   wheatherStateName = data['current']['condition']['text'];
  // }

  factory WeatherModel.fromJason(dynamic data) {
    return WeatherModel(
        date: data["location"]["localtime"],
        temp: data['current']['temp_c'],
        code: data['current']['condition']['code'],
        minTemp: data['current']['temp_f'],
        wheatherStateName: data['current']['condition']['text']);
  }

  @override
  String toString() {
    return 'temp = $temp  mintemp= $minTemp dateeeeeeeeeee = $date ';
  }

  String getImage() {
    if (wheatherStateName == 'Clear' || wheatherStateName == 'Light Cloude') {
      return 'Images/download.png';
    } else if (wheatherStateName == 'Heavy Cloud' ||
        wheatherStateName == 'Light Cloude')
      return 'Images/Cloudy.jpeg';
    else if (wheatherStateName == 'Light Rain' ||
        wheatherStateName == 'Heavy Rain')
      return 'Images/Rain.png';
    else if (wheatherStateName == 'Thunder') return 'Images/Rain.png';
    return 'Images/Cloudy.png';
  }

  MaterialColor getThemeColor() {
    if (wheatherStateName == 'Clear' || wheatherStateName == 'Light Cloude') {
      return Colors.blue;
    } else if (wheatherStateName == 'Heavy Cloud' ||
        wheatherStateName == 'Light Cloude')
      return Colors.red;
    else if (wheatherStateName == 'Light Rain' ||
        wheatherStateName == 'Heavy Rain')
      return Colors.green;
    else if (wheatherStateName == 'Thunder') return Colors.deepPurple;
    return Colors.yellow;
  }
}
