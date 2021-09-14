import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/weather.dart';

class Fetch {
  // String appWeather =
  //     'http://api.weatherapi.com/v1/current.json?key=8b89699e4fe8416b81464324213108&q=Kathmandu&aqi=yes';

  static Future<Weather>? weatherData({String? cityWeather = "city"}) async {
    http.Response response = await http.get(
      Uri.parse(
          '//api.weatherapi.com/v1/current.json?key=8b89699e4fe8416b81464324213108&q=$cityWeather&aqi=no'),
    );
    var results = jsonDecode(response.body);
    var data = Weather.fromJson(results);
    return data;
  }
}
