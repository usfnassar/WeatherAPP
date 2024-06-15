import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_appp/main.dart';
import 'package:weather_appp/views/search_view.dart';
import 'package:weather_appp/widgets/no_weather.dart';
import 'package:weather_appp/widgets/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(

            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SerachView();
                  }));
                },
                icon: Icon(Icons.search,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10,),
            ],
            elevation: 0.3,
            centerTitle: true,
            title: Text('Weather App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          body: BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              if (state is WeatherInitialState) {
                return const NoWeather();
              }
              else if (state is WeatherLoadedState) {
                return WeatherInfo();
              }
              else if (state is WeatherLoadingState) {
                return const Center(
                    child:
                    CircularProgressIndicator(
                      color: Colors.black,
                    )
                );
              }
              else {
                return const Center(child: Text(
                  'Can\'t Find This City!',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),

                )
                );
              }
            },
          ),
        );
      },
    );
  }
}
