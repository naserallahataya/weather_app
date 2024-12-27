import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable, camel_case_types
class searchPage extends StatelessWidget {
  String? cityName;
  searchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" Search a City ")),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onSubmitted: (data)  async {   
            cityName = data;

            BlocProvider.of<WeatherCubit>(context)
                .getWeather(cityName: cityName!);
                BlocProvider.of<WeatherCubit>(context)
                .cityName=cityName;
            Navigator.pop(context);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search),
            label: Text("Search"),
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 35),
            hintText: " Enter City ",
          ),
        ),
      )),
    );
  }
}
