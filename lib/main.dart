import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newweatherapp/cubits/getweathercubit/get_weather_cubits.dart';
import 'package:newweatherapp/cubits/getweathercubit/get_weather_states.dart';
import 'package:newweatherapp/views/homeview.dart';

void main() {
  runApp(mainapp());
}

class mainapp extends StatelessWidget {
  const mainapp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getWeatherMaterialColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weather
                        ?.weatherCondition),
              ),
              home: homeview(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherMaterialColor(String? day) {
  if (day == null) {
    return Colors.blue;
  } else {
    switch (day) {
      case "Sunny":
        return Colors.yellow;
      case "Partly cloudy":
        return Colors.blue;
      case "Cloudy":
        return Colors.grey;
      case "Overcast":
        return Colors.blueGrey;
      case "Mist":
        return Colors.grey;
      case "Patchy rain possible":
      case "Patchy snow possible":
      case "Patchy sleet possible":
      case "Patchy freezing drizzle possible":
        return Colors.lightBlue;
      case "Thundery outbreaks possible":
        return Colors.red;
      case "Blowing snow":
      case "Blizzard":
        return Colors.grey;
      case "Fog":
      case "Freezing fog":
        return Colors.grey;
      case "Patchy light drizzle":
      case "Light drizzle":
      case "Freezing drizzle":
      case "Heavy freezing drizzle":
        return Colors.lightBlue;
      case "Patchy light rain":
      case "Light rain":
      case "Moderate rain at times":
      case "Moderate rain":
      case "Heavy rain at times":
      case "Heavy rain":
        return Colors.blue;
      case "Light freezing rain":
      case "Moderate or heavy freezing rain":
        return Colors.lightBlue;
      case "Light sleet":
      case "Moderate or heavy sleet":
        return Colors.lightBlue;
      case "Patchy light snow":
      case "Light snow":
      case "Patchy moderate snow":
      case "Moderate snow":
      case "Patchy heavy snow":
      case "Heavy snow":
        return Colors.grey;
      case "Ice pellets":
        return Colors.lightBlue;
      case "Light rain shower":
      case "Moderate or heavy rain shower":
      case "Torrential rain shower":
        return Colors.blue;
      case "Light sleet showers":
      case "Moderate or heavy sleet showers":
        return Colors.lightBlue;
      case "Light snow showers":
      case "Moderate or heavy snow showers":
        return Colors.grey;
      case "Light showers of ice pellets":
      case "Moderate or heavy showers of ice pellets":
        return Colors.lightBlue;
      case "Patchy light rain with thunder":
      case "Moderate or heavy rain with thunder":
      case "Patchy light snow with thunder":
      case "Moderate or heavy snow with thunder":
        return Colors.red;
      default:
        return Colors.grey; // Default color if day not found
    }
  }
}
