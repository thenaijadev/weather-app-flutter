import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "images/space.jpg",
              width: 350.0,
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Discover the weather in any part of the world",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0),
              ),
            ),
            RawMaterialButton(
              splashColor: Colors.black,
              highlightColor: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, "/searchCity");
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
                      offset: const Offset(1, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Get Started",
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
        ));
  }
}
