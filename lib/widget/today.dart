import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


String getTime(final timeStamp){
  DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  String hour = DateFormat('jm').format(time);
  return hour;
}

String getDay(final monthDay){
  String dateAndMoth = DateFormat.MMMd().format(DateTime.now());
  return dateAndMoth;
}

Widget Today(String temp, String icon, String dt, int index){
  return Container(
    margin: EdgeInsets.all(20),
    child: Container(
      //frame children of today
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue, width: 1.0)
          ),

          height: 70,
          width: 100,

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
     children:[
        Text(style: const TextStyle(color: Colors.white,),
          "$temp \u2103"
        ),
        Container(
          //image
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(10),
          child: Image.asset("lib/assets/icon_weather/$icon.png"),
        ),
        
        Text(style: const TextStyle(color: Colors.white),
          getTime(
              int.parse(dt))
          ),
  ])),
  );
}