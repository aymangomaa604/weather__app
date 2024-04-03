import 'package:newweatherapp/models/weather_model.dart';

abstract class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {

}

class WeatherErrState extends WeatherState {}
