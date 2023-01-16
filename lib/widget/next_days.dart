import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



String getDay(final day){
  DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
  final dayInWeek = DateFormat.EEEE().format(time);
  return dayInWeek;
}

Widget NextDays(String dt, String icon, String tempMax, String tempMin){

  return SizedBox(
    height: 65,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold) ,getDay(int.parse(dt))),
                Image.asset(
                    "lib/assets/icon_weather/$icon.png",
                  height: 40,
                  width: 40,
                ),
                Text("$tempMax\u2103   $tempMin\u2103", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
        ),
      ],
    ),
  );
}