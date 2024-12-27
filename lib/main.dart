import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/weather_cubit.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/services/weather_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:  HomePage());
  }
}
