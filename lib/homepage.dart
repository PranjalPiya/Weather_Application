import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/weather.dart';
import 'dart:convert';
import 'fetch_weather.dart';
import 'package:weather_app/weather_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchWeather = TextEditingController();
  Future<Weather>? data;

  String? cData;
  bool showclearbutton = false;
  final _formvalid = GlobalKey<FormState>();

  @override
  void initState() {
    // this.weatherData();
    data = Fetch.weatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        centerTitle: true,
        title: Text(
          'Weather App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<Weather>(
              future: data,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return Column(
                    children: [
                      // ListTile(
                      //   title: Container(
                      //     child: Form(
                      //       key: _formvalid,
                      //       child: TextFormField(
                      //         controller: searchWeather,
                      //         textInputAction: TextInputAction.search,
                      //         onChanged: (value) {
                      //           cData = value;
                      //         },
                      //         validator: (value) {
                      //           if (value!.isEmpty) {
                      //             return 'Plese enter the city or country name.';
                      //           } else {
                      //             return null;
                      //           }
                      //         },
                      //         decoration: InputDecoration(
                      //           hintText: 'Enter City name'.toUpperCase(),
                      //           hintStyle: TextStyle(
                      //             fontSize: 15,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   trailing: IconButton(
                      //     onPressed: () {
                      //       FocusScope.of(context).unfocus();
                      //       searchWeather.clear();
                      //       setState(() {});
                      //     },
                      //     icon: Icon(Icons.close),
                      //   ),
                      //   leading: IconButton(
                      //     onPressed: () {
                      //       if (_formvalid.currentState!.validate()) {
                      //         _formvalid.currentState!.save();
                      //         FocusScope.of(context).unfocus();
                      //         if (cData != null || cData!.isNotEmpty) {
                      //           data = Fetch.weatherData(cityWeather: "$cData");
                      //           setState(() {});
                      //         }
                      //       }

                      //     },
                      //     icon:

                      //         Icon(Icons.search),
                      //   ),

                      // ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      // TextFormField(
                      //   cursorColor: Colors.black,
                      //   decoration: new InputDecoration(
                      //       border: InputBorder.none,
                      //       focusedBorder: InputBorder.none,
                      //       enabledBorder: InputBorder.none,
                      //       errorBorder: InputBorder.none,
                      //       disabledBorder: InputBorder.none,
                      //       contentPadding: EdgeInsets.only(
                      //           left: 15, bottom: 11, top: 11, right: 15),
                      //       hintText: "Hint here"),
                      // ),

                      Container(
                        padding: EdgeInsets.all(30),
                        child: Center(
                          child: Text(
                            '${snapshot.data?.location?.country}, ${snapshot.data?.location?.name}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${snapshot.data?.location?.localtime}',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        height: 200,
                        width: 230,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'http:${snapshot.data?.current?.condition?.icon}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${snapshot.data?.current?.tempC} \u2103',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${snapshot.data?.current?.condition?.text}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 40, right: 40),
                        child: Divider(
                          height: 10,
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: Container(
                          child: Form(
                            key: _formvalid,
                            child: TextFormField(
                              controller: searchWeather,
                              textInputAction: TextInputAction.search,
                              onChanged: (value) {
                                cData = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Plese enter the city or country name.';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter City name'.toUpperCase(),
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            searchWeather.clear();
                            setState(() {});
                          },
                          icon: Icon(Icons.close),
                        ),
                        leading: IconButton(
                          onPressed: () {
                            if (_formvalid.currentState!.validate()) {
                              _formvalid.currentState!.save();
                              FocusScope.of(context).unfocus();
                              if (cData != null || cData!.isNotEmpty) {
                                data = Fetch.weatherData(cityWeather: "$cData");
                                setState(() {});
                              }
                            }
                          },
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ],
                  );
                  // print('good job');
                }

                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
