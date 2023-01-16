import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';


class WeatherService {
  Future<WeatherModel>? getWeatherModel(double? lat, double? lon) async {
    String apiKey = '3ac2eae75f7992e55a4d85a3af7be8fa';
    var url = Uri.parse(
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=${apiKey}&units=metric");
    var response = await http.get(url);
    var body = jsonDecode(response.body);
    print(response.statusCode);
    print(lat);
    print(lon);
    print('in '+ body['timezone']);
    return WeatherModel.fromJson(body);
  }
}
