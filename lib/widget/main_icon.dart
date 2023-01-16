

import 'package:flutter/material.dart';

Widget MainIcon(String location, String temp, String icon) {


  return Column(
    children: [

      Text(location, style: const TextStyle(fontSize: 30, color: Colors.white),),
        Image.asset(
        "lib/assets/main_icon/$icon.png",
        height: 200,
        width: 200,
      ),

      Text(
        "$temp\u2103",
        style: const TextStyle(fontSize: 45,
        fontWeight:FontWeight.w500,
        color: Colors.white),
      ),
    ],
  );
}
