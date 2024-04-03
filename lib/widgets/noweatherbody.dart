import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newweatherapp/cubits/getweathercubit/get_weather_cubits.dart';
import 'package:newweatherapp/views/search_view.dart';

class noweatherbody extends StatelessWidget {
  const noweatherbody({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    ));
  }
}
