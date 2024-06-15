import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_appp/model/weather_model.dart';

class ServicesWeather{
  final Dio dio;
  final String baseUrl='http://api.weatherapi.com/v1';
  final String key='dce94a45ec42443bb3495749231209';

  ServicesWeather(this.dio);
  Future<WeatherModel> getCurrentWeather({required String city}) async
  {
    try {
      Response response=await dio.get('$baseUrl/forecast.json?key=$key&q=$city');
      WeatherModel weatherModel= WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage=e.response?.data['error']['message']??'there an error, try again later';
      throw Exception(errorMessage);
    }
    catch(e){
      log(e.toString());
      throw Exception('there an error, try again later');
    }

  }

}
