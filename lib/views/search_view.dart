import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_appp/model/weather_model.dart';
import 'package:weather_appp/services/services_weather.dart';

class SerachView extends StatelessWidget {
  const SerachView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.blue[300]!,
              Colors.blue[50]!,
            ]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(child: TextField(
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
           onSubmitted: (value)async{
             var weatherModel=BlocProvider.of<GetWeatherCubit>(context);
             weatherModel.getWeather(city: value);
             Navigator.pop(context);
             // log(weatherModel.city);
           },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(32.0),

              suffixIcon: IconButton(
                  onPressed: (){},
                icon: Icon(Icons.search),
              ),
              labelText: 'Search',
              hintText: 'Search City',
              labelStyle: TextStyle(
              ),
              hintStyle: TextStyle(
                  color: Colors.white
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),

            ),
          )),
        ),
      ),
    );
  }
}
