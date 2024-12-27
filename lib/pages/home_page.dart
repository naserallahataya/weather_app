import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/weather_cubit.dart';
import 'package:flutter_application_1/cubit/weather_state.dart';
import 'package:flutter_application_1/pages/search_page.dart';
import 'package:flutter_application_1/wheatherMdole/wheather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text("Weather App"),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            return SuccessBOdy(
              weatherData: state.weatherModel,
            );
          } else if (state is WeatherFailure) {
            return Center(
              child: Text('Something went wrong please try again '),
            );
          } else {
            return defaultBody();
          }
        },
      ),
    );
  }
}

class defaultBody extends StatelessWidget {
  const defaultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.grey,
          Colors.grey[300]!,
          Colors.grey[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "There is no Weather ! start searching now ",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessBOdy extends StatelessWidget {
  SuccessBOdy({Key? key, required this.weatherData}) : super(key: key);

  final WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    print(weatherData);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weatherData!.getThemeColor(),
          weatherData!.getThemeColor()[300]!,
          weatherData!.getThemeColor()[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(flex: 3),
        Text(BlocProvider.of<WeatherCubit>(context).cityName!,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        Text('update at ${weatherData!.date.toString()}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(weatherData!.getImage()),
            Text(' ${weatherData!.temp.toInt()}',
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Column(
              children: [
                Text('maxTemp  ${weatherData!.temp.toInt()} '),
                Text('minTemp  ${weatherData!.minTemp.toInt()}'),
              ],
            ),
          ],
        ),
        const Spacer(),
        Text(weatherData!.wheatherStateName,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        const Spacer(
          flex: 5,
        ),
      ]),
    );
  }
}
