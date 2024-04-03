import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newweatherapp/main.dart';
import 'package:newweatherapp/models/weather_model.dart';
import 'package:newweatherapp/views/search_view.dart';

import '../cubits/getweathercubit/get_weather_cubits.dart';

class WeatherInfoBody extends StatefulWidget {
  const WeatherInfoBody({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherInfoBody> createState() => _WeatherInfoBodyState();
}

class _WeatherInfoBodyState extends State<WeatherInfoBody> {
  @override
  Widget build(BuildContext context) {
    weatherModel weathermodel = BlocProvider.of<GetWeatherCubit>(context).weather!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [

          getWeatherMaterialColor(weathermodel.weatherCondition),
          getWeatherMaterialColor(weathermodel.weatherCondition)[300]!,
          getWeatherMaterialColor(weathermodel.weatherCondition)[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityNmae,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updatedAt${weathermodel.date.substring(10)}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weathermodel.image!}",
                ),
                Text(
                  weathermodel.temp.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'maxTemp: ${weathermodel.maxTemp.toInt()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'maxTemp: ${weathermodel.minTemp.toInt()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weathermodel.weatherCondition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
