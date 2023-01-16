class WeatherModel {
  String? timezone;
  int? temp;
  double? windSpeed;
  String? humidity;
  String? icon;
  String? today_dt;
  List<String>? hourly_dt;
  List<int>? hourly_temp;
  List<String>? hourly_icon;
  List<String>? daily_dt;
  List<int>? daily_temp_max;
  List<int>? daily_temp_min;
  List<String>? daily_icon;

  WeatherModel({
    this.timezone,
    this.temp,
    this.windSpeed,
    this.humidity,
    this.icon,
    this.today_dt,
    this.hourly_dt,
    this.hourly_temp,
    this.hourly_icon,
    this.daily_dt,
    this.daily_icon,
    this.daily_temp_max,
    this.daily_temp_min,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    timezone = json["timezone"].toString();
    temp = json["current"]["temp"].round();
    windSpeed = json["current"]["wind_speed"];
    humidity = json["current"]["humidity"].toString();
    icon = json["current"]["weather"][0]["icon"].toString();
    today_dt = json["current"]["dt"].toString();
    hourly_dt = [
      json["hourly"][0]["dt"].toString(),
      json["hourly"][1]["dt"].toString(),
      json["hourly"][2]["dt"].toString(),
      json["hourly"][3]["dt"].toString(),
      json["hourly"][4]["dt"].toString(),
      json["hourly"][5]["dt"].toString(),
    ];

    hourly_temp = [
      json["hourly"][0]["temp"].round(),
      json["hourly"][1]["temp"].round(),
      json["hourly"][2]["temp"].round(),
      json["hourly"][3]["temp"].round(),
      json["hourly"][4]["temp"].round(),
      json["hourly"][5]["temp"].round(),
    ];

    hourly_icon = [
      json["hourly"][0]["weather"][0]["icon"].toString(),
      json["hourly"][1]["weather"][0]["icon"].toString(),
      json["hourly"][2]["weather"][0]["icon"].toString(),
      json["hourly"][3]["weather"][0]["icon"].toString(),
      json["hourly"][4]["weather"][0]["icon"].toString(),
      json["hourly"][5]["weather"][0]["icon"].toString(),
    ];

    daily_temp_max = [
      json["daily"][0]["temp"]["max"].round(),
      json["daily"][1]["temp"]["max"].round(),
      json["daily"][2]["temp"]["max"].round(),
      json["daily"][3]["temp"]["max"].round(),
      json["daily"][4]["temp"]["max"].round(),
      json["daily"][5]["temp"]["max"].round(),
      json["daily"][6]["temp"]["max"].round(),
    ];

    daily_temp_min = [
      json["daily"][0]["temp"]["min"].round(),
      json["daily"][1]["temp"]["min"].round(),
      json["daily"][2]["temp"]["min"].round(),
      json["daily"][3]["temp"]["min"].round(),
      json["daily"][4]["temp"]["min"].round(),
      json["daily"][5]["temp"]["min"].round(),
      json["daily"][6]["temp"]["min"].round(),
    ];

    daily_icon = [
      json["daily"][0]["weather"][0]["icon"].toString(),
      json["daily"][1]["weather"][0]["icon"].toString(),
      json["daily"][2]["weather"][0]["icon"].toString(),
      json["daily"][3]["weather"][0]["icon"].toString(),
      json["daily"][4]["weather"][0]["icon"].toString(),
      json["daily"][5]["weather"][0]["icon"].toString(),
      json["daily"][6]["weather"][0]["icon"].toString(),
    ];

    daily_dt = [
      json["daily"][0]["dt"].toString(),
      json["daily"][1]["dt"].toString(),
      json["daily"][2]["dt"].toString(),
      json["daily"][3]["dt"].toString(),
      json["daily"][4]["dt"].toString(),
      json["daily"][5]["dt"].toString(),
      json["daily"][6]["dt"].toString(),
    ];
  }
}
