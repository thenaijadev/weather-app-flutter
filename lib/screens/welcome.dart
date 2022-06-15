import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    scheduleTimeout(5 * 1000);
  }

  Timer scheduleTimeout([int milliseconds = 10000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  void handleTimeout() {
    Navigator.pushNamed(context, "/description");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            width: 500.0,
            height: 200.0,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('images/welcome.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 126, 126, 126).withOpacity(0.8),

                  blurRadius: 5,
                  offset: const Offset(2, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'the_naija_dev',
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "IndieFlower"),
                  speed: const Duration(milliseconds: 200),
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          )
        ],
      ),
    );
  }
}
