import 'package:flutter/material.dart';
import 'package:my_weather_app/screens/searchCity.dart';
import 'package:my_weather_app/screens/welcome.dart';
import 'screens/description.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const WelcomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/description': (context) => const DescriptionPage(),
        '/searchCity': (context) => const CityInputPage(),
      },
    );
  }
}
