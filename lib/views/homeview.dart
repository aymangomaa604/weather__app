import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newweatherapp/cubits/getweathercubit/get_weather_cubits.dart';
import 'package:newweatherapp/cubits/getweathercubit/get_weather_states.dart';
import 'package:newweatherapp/views/search_view.dart';
import 'package:newweatherapp/widgets/noweatherbody.dart';
import 'package:newweatherapp/widgets/weatherinfobody.dart';

class homeview extends StatelessWidget {
  const homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchview();
                }));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return noweatherbody();
          } else if (state is WeatherLoadedState) {
          
            return WeatherInfoBody();
          } else {
            return Text('opps there was an error');
          }
        },
      ),
    );
  }
}
