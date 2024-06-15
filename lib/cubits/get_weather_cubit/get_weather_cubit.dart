import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_appp/services/services_weather.dart';

import '../../model/weather_model.dart';

class GetWeatherCubit extends Cubit<WeatherStates>
{
  GetWeatherCubit():super(WeatherInitialState());
   WeatherModel? weatherModel;
  getWeather({required String city})async
  {
    emit(WeatherLoadingState());
    try {
       weatherModel= await ServicesWeather(Dio()).getCurrentWeather(city: city);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailedState());
    }
  }

}
