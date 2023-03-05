import 'dart:convert';

import 'package:http/http.dart';

import '../constants/api_constants.dart';
import '../models/weatherModels.dart';

class ApiServices {
  static Future<WeatherModel?> getModel(String city) async {
    WeatherModel? wm;
       final queryParameters = {
        'Key': '$API_KEY',
        'q': '$city',
      };

      final uri =
          Uri.parse('$BASEURL').replace(queryParameters: queryParameters);
      final response = await get(uri);
    // print(response.body);
      var jsonResponse = jsonDecode(response.body);


     if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    final jsonResponse = json.decode(response.body);
    return WeatherModel.fromJson(jsonResponse);
  } else {
    // If that call was not successful, throw an error
    throw Exception('Failed to load data');
  }

    //  print(jsonResponse);
   

    //return WeatherModel.fromJson(json);
   
  }

}
/* 
city
country
datetime
humidity 
remporeture
condition => text + icon 


*/