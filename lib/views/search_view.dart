import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newweatherapp/cubits/getweathercubit/get_weather_cubits.dart';
import 'package:newweatherapp/models/weather_model.dart';
import 'package:newweatherapp/services/weather_services.dart';

class searchview extends StatelessWidget {
  searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page '),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<GetWeatherCubit>(context)
                  .GetWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration:const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 35, horizontal: 20),
              labelText: 'search',
              border: OutlineInputBorder(),
              hintText: 'Enter A City',
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}

//weatherModel? weather;
