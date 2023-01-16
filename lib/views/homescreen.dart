import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weazer_getx/models/weather_model.dart';
import 'package:weazer_getx/widget/main_icon.dart';
import '../controllers/weather_controller.dart';
import '../services/weather_service.dart';
import '../widget/current_weather.dart';
import '../widget/next_days.dart';
import '../widget/today.dart';



class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //call get controller
  final WeatherController weatherController = Get.put(WeatherController(), permanent: true);

  WeatherService x = WeatherService();
  WeatherModel? data;

  Future<void> getData() async {
    data = await x.getWeatherModel(
        weatherController.getLatitude().toDouble(),
        weatherController.getLongitude().toDouble());
  }

  // Future<void> _refreshData() async {
  //   await getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
      // RefreshIndicator(
        //     onRefresh: _refreshData,
        //     child:
           Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                        colors: [
                          Color.fromARGB(255, 0, 0, 0),
                          Color.fromARGB(255, 22, 72, 183),
                          Color.fromARGB(255, 34, 90, 222),
                          Color.fromARGB(255, 56, 115, 239)
                        ])),
              height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView(
                        children: [
                          //const SizedBox(
                           // height: 30,
                         // ),
                          Container(
                            child: MainIcon(
                              "${data?.timezone}",
                              "${data?.temp}",
                              "${data?.icon}",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: currentWeather(
                                "${data?.windSpeed}", "${data?.humidity}"),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.indigo[800],
                                borderRadius: BorderRadius.circular(25),
                              ),

                              child: Column(
                                //Today
                              children:[
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(children: const [
                              Text("Today", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 70)),
                            ]),
                          ),
                          SizedBox(
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (BuildContext context, index) {
                                  return Today(
                                    "${data?.hourly_temp?[index]}",
                                    "${data?.hourly_icon?[index]}",
                                    "${data?.hourly_dt?[index]}",
                                    index,
                                  );
                                }),
                          )])),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            //next forecast
                            margin: const EdgeInsets.all(20),
                            height: 350,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.indigo[800],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                 Row(children:const [Padding(padding: EdgeInsets.all(10)) ,Text("Next Forecast",
                                style: ( TextStyle (
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )))]),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 250,
                                  width: 400,
                                  child: ListView.builder(
                                      itemCount: 7,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return NextDays(
                                          "${data?.daily_dt![index]}",
                                          "${data?.daily_icon?[index]}",
                                          "${data?.daily_temp_max?[index]}",
                                          "${data?.daily_temp_min?[index]}",
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: RefreshProgressIndicator(
                      color: Colors.tealAccent,
                    ),
                  );
                }
                return Text('Fail to load data');
              },
            )
            )

            );
  }
}
