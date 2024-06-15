import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_appp/main.dart';
import 'package:weather_appp/model/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});
  // final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weather=BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            getThemeWeather(weather.condition),
            getThemeWeather(weather.condition)[300]!,
            getThemeWeather(weather.condition)[50]!,

          ],
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              weather.city,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
             SizedBox(height: 10.0,),
             Text(
              'updated at ${weather.date.hour}:${weather.date.minute}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weather.image}',
                ),

                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
                   child: Text(
                    '${weather.temp.round()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                ),
                 ),
                 Column(
                  children: [
                    Text(
                      'Maxtemp: ${weather.maxTemp.round()}\n',
                      style: TextStyle(
                          fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weather.minTemp.round()}',
                      style: TextStyle(
                          fontSize: 16,
                        color: Colors.white,
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
              weather.condition,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
