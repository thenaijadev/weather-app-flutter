import 'package:flutter/material.dart';
import 'searchCity.dart';
import 'home.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key, this.city}) : super(key: key);
  final String? city;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  String? cityName;
  @override
  void initState() {
    super.initState();
    cityName = widget.city;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: HomePage(
        city: cityName,
      ),
    );
  }
}
