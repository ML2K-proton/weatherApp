import 'package:flutter/material.dart';

String datetime = DateTime.now().toString();

Widget currentWeather(String wind, String humidity) {
  return Container(
    height: 50,
    width: 100,
    margin: EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.indigo[800],
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [


      Image.asset("lib/assets/main_icon/humidity0.png"),
      Text("$humidity %", style: TextStyle(color: Colors.white),),
      Padding(padding: EdgeInsets.symmetric(horizontal: 20.0)),
      Image.asset("lib/assets/main_icon/wind0.png",),
      Text("$wind km/h", style: TextStyle(color: Colors.white),),
    ]),
  );
}
