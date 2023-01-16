import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weazer_getx/views/homescreen.dart';
import 'package:get/get.dart';

import 'controllers/weather_controller.dart';

void main()  {
  Get.put(WeatherController(), permanent: true);
 // WidgetsFlutterBinding.ensureInitialized();
   initialization(null);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async{
  await Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Homescreen(),
      title: "Weazer",
      debugShowCheckedModeBanner: false,
    );
  }
}