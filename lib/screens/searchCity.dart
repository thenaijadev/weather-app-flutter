// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_weather_app/screens/navigation.dart';

class CityInputPage extends StatefulWidget {
  const CityInputPage({Key? key}) : super(key: key);

  @override
  State<CityInputPage> createState() => _CityInputPageState();
}

class _CityInputPageState extends State<CityInputPage> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  'images/city.jpg',
                  height: 400.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    if (value == "") {
                      cityName = "lagos";
                    } else {
                      cityName = value;
                    }
                  },
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 10, 25, 243),
                            width: 2.0),
                      ),
                      border: UnderlineInputBorder(),
                      hintText: 'What is the name of your city?',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              RawMaterialButton(
                splashColor: Colors.black,
                highlightColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NavigationPage(
                              city: cityName,
                            )),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 40.0),
                  width: 500.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 10, 25, 243),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 74, 74, 74)
                            .withOpacity(0.8),

                        blurRadius: 5,
                        offset:
                            const Offset(1, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Get Weather Data",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
