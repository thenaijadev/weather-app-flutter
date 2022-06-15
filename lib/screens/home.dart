import 'package:flutter/material.dart';
import 'package:my_weather_app/utilities/weather.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.city}) : super(key: key);
  final String? city;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? city;
  dynamic weatherData;
  int? temperature;
  String? weatherMessage;
  String? weatherIcon;
  String? cityName;
  String? description;
  @override
  void initState() {
    super.initState();
    city = widget.city;
  }

  Future<dynamic> getWeatherData(city) async {
    WeatherModel weather = WeatherModel();
    weatherData = await weather.getCityWeather(city);
    setState(() {
      double? temp = weatherData["main"]["temp"];
      temperature = temp!.toInt();
      weatherMessage = weather.getMessage(temperature!);
      var condition = weatherData["weather"][0]["id"];
      weatherIcon = weather.getWeatherIcon(condition!);
      cityName = weatherData["name"];
      description = weatherData["weather"][0]["description"];
    });

    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getWeatherData(city);
    });
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RawMaterialButton(
                splashColor: Colors.black,
                highlightColor: Colors.black,
                onPressed: () {
                  setState(() {
                    getWeatherData(city);
                  });
                },
                child: const Icon(Icons.refresh),
              ),
              RawMaterialButton(
                splashColor: Colors.black,
                highlightColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "/searchCity");
                },
                child: const Icon(Icons.search),
              )
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
              child: Text(
                // ignore: unnecessary_string_interpolations
                "${cityName ?? 'Network error please refresh.'}",
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          const SizedBox(
            height: 100.0,
          ),
          const Center(
            child: Text(
              'Todays Report',
              style: TextStyle(fontSize: 55.0),
            ),
          ),
          Center(
            child: Text(
              "${weatherIcon ?? 0}",
              style: const TextStyle(fontSize: 80.0),
            ),
          ),
          Center(
            child: Text(
              "${temperature ?? 0}°C",
              style: const TextStyle(fontSize: 80.0),
            ),
          ),
          Center(
            child: Text(
              "${description ?? 0}",
              style: const TextStyle(fontSize: 30.0),
            ),
          ),
        ]);
  }
}
