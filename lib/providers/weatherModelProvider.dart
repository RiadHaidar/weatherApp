

import 'package:flutter/material.dart';

import '../models/weatherModels.dart';
import '../services/api_services.dart';

class WeatheModelProvider extends ChangeNotifier{

 WeatherModel? weatherModel;

  bool isLoading = true;


  Future<WeatherModel?> getWeather(city)async{
 await ApiServices.getModel(city).then((value) {
  print('xx');
  print(value!.current!.isDay);
weatherModel = value;
  
 } );
    isLoading=false;
 // print(weatherModel!.current!.isDay.toString());
  notifyListeners();
    return weatherModel!;
  }

}