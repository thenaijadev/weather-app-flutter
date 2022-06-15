import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';

class WeatherModel {
  String? apiKey = "";
  String? url = 'https://api.openweathermap.org/data/2.5/weather';
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getCityWeather(String cityName) async {
    await FlutterConfig.loadEnvVariables();

    apiKey = FlutterConfig.get("API_KEY");

    var cityNameUri = '$url?q=$cityName&appid=$apiKey&units=metric';
    var urlLink = Uri.parse(cityNameUri);
    var response = await http.get(urlLink);
    if (response.statusCode == 200) {
      var weatherData = response.body;
      return jsonDecode(weatherData);
    } else {
      print(response.statusCode);
    }
  }
}
