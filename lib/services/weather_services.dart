import 'dart:developer';
//import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newweatherapp/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  WeatherServices(this.dio);
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '44a050d61c7649f0a32113559230907';
  Future<weatherModel> getcurrentweather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

      weatherModel weathermodel = weatherModel.fromjson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String ERRmessage = e.response?.data['error']['message'] ??
          'there was an error try later ';
      throw Exception(ERRmessage);
    } catch (e) {
      log(e.toString());
      throw Exception('there was an error try later');
    }
  }
}
