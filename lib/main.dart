import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'cubits/get_weather_cubit/get_weather_states.dart';
import 'views/home_views.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) {
            return BlocBuilder<GetWeatherCubit, WeatherStates>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: getThemeWeather(BlocProvider
                        .of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.condition),
                  ),
                  home: HomeView(),
                );
              },
            );
          }
      ),
    );
  }
}


MaterialColor getThemeWeather(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
      return Colors.orange;
    case "Partly cloudy":
      return Colors.grey;
    case "Cloudy":
      return Colors.blue;
    case "Overcast":
      return Colors.grey;
    case "Mist":
      return Colors.grey;
    case "Patchy rain possible":
      return Colors.blue;
    case "Patchy snow possible":
      return Colors.blue;
    case "Patchy sleet possible":
      return Colors.blue;
    case "Patchy freezing drizzle possible":
      return Colors.blue;
    case "Thundery outbreaks possible":
      return Colors.indigo;
    case "Blowing snow":
      return Colors.blue;
    case "Blizzard":
      return Colors.blue;
    case "Fog":
      return Colors.grey;
    case "Freezing fog":
      return Colors.grey;
    case "Patchy light drizzle":
      return Colors.blue;
    case "Light drizzle":
      return Colors.blue;
    case "Freezing drizzle":
      return Colors.blue;
    case "Heavy freezing drizzle":
      return Colors.blue;
    case "Patchy light rain":
      return Colors.blue;
    case "Light rain":
      return Colors.blue;
    case "Moderate rain at times":
      return Colors.blue;
    case "Moderate rain":
      return Colors.blue;
    case "Heavy rain at times":
      return Colors.blue;
    case "Heavy rain":
      return Colors.blue;
    case "Light freezing rain":
      return Colors.blue;
    case "Moderate or heavy freezing rain":
      return Colors.blue;
    case "Light sleet":
      return Colors.blue;
    case "Moderate or heavy sleet":
      return Colors.blue;
    case "Patchy light snow":
      return Colors.blue;
    case "Light snow":
      return Colors.blue;
    case "Patchy moderate snow":
      return Colors.blue;
    case "Moderate snow":
      return Colors.blue;
    case "Patchy heavy snow":
      return Colors.blue;
    case "Heavy snow":
      return Colors.blue;
    case "Ice pellets":
      return Colors.blue;
    case "Light rain shower":
      return Colors.blue;
    case "Moderate or heavy rain shower":
      return Colors.blue;
    case "Torrential rain shower":
      return Colors.blue;
    case "Light sleet showers":
      return Colors.blue;
    case "Moderate or heavy sleet showers":
      return Colors.blue;
    case "Light snow showers":
      return Colors.blue;
    case "Moderate or heavy snow showers":
      return Colors.blue;
    case "Light showers of ice pellets":
      return Colors.blue;
    case "Moderate or heavy showers of ice pellets":
      return Colors.blue;
    case "Patchy light rain with thunder":
      return Colors.indigo;
    case "Moderate or heavy rain with thunder":
      return Colors.indigo;
    case "Patchy light snow with thunder":
      return Colors.indigo;
    case "Moderate or heavy snow with thunder":
      return Colors.indigo;
    default:
      return Colors.blue;
  }
}


