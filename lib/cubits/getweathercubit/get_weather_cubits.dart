import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newweatherapp/cubits/getweathercubit/get_weather_states.dart';
import 'package:newweatherapp/models/weather_model.dart';
import 'package:newweatherapp/widgets/noweatherbody.dart';

import '../../services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  
   weatherModel? weather;
  GetWeather({required cityName}) async {
    try {
       weather =
          await WeatherServices(Dio()).getcurrentweather(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherErrState());
      // TODO
    }
  }
}
