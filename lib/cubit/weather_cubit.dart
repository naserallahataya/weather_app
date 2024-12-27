import 'package:flutter_application_1/cubit/weather_state.dart';
import 'package:flutter_application_1/services/weather_service.dart';
import 'package:flutter_application_1/wheatherMdole/wheather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherService weatherService;
  String? cityName;

  WeatherCubit(this.weatherService) : super(WeatherInitial());
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      WeatherModel? weatherModel =await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel:weatherModel! ));
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
