// import 'dart:developer';

// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Data {
//   void weattherData() {
//     //http://api.weatherapi.com/v1/current.json?key=8b89699e4fe8416b81464324213108&q=Kathmandu&aqi=no

//     final parameters = {'q': '', 'appkey': ''};
//     final uri = Uri.https('api.weatherapi.com', 'v1/current.json', parameters);
//   }
// }

// Future weatherData() async{
//   http.Response response = await http.get("http://api.weatherapi.com/v1/current.json?key=8b89699e4fe8416b81464324213108&q=Kathmandu&aqi=no");
//   var results = jsonDecode(response.body);
//   s
// }

// class Weather{
//   final cityName;
//   final countryName;
//   final time;
//   final temp;
//   final description;

//   Weather(this.cityName, this.countryName, this.time, this.temp, this.description);

//   factory Weather.fromJson(Map<String, dynamic> json){
//     return Weather(cityName: json['location']['temp'].toString() ,);
//   }

// }
// this.cityName = results['location']['name'].toString();
// this.countryName = results['location']['country'].toString();
// this.time = results['location']['localtime'].toString();
// this.temp = results['current']['temp_c'].toString();
// this.description = results['current']['condition']['text'].toString();

// Future<weatherinfo> weatherData() async {
//   final apiKey;
//   final apiURL =
//       'http://api.weatherapi.com/v1/current.json?key=8b89699e4fe8416b81464324213108&q=Kathmandu&aqi=yes';

//   final response = await http.get(Uri.parse(apiURL));

//   if (response.statusCode == 200) {
//     var repo = jsonDecode(response.body);
//     return repo;
//   } else {
//     throw Exception("Error");
//   }
// }

// class weatherinfo {
//   final cityName;
//   final countryName;
//   final time;
//   final temp;
//   final description;

//   weatherinfo(
//       this.cityName, this.countryName, this.time, this.temp, this.description);
// }
