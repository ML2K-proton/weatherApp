import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController{
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  @override
  void onInit() {
    if(_isLoading.isTrue){
      getLocation();
    }
    super.onInit();
  }

  getLocation() async{
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!isServiceEnabled){
      return Future.error("Location is not enabled.");
    }

    locationPermission = await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.deniedForever){
      return Future.error("Location permission denied forever.");
    }
    else if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
        return Future.error("Location permission denied.");
      }
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high).then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      _isLoading.value = false;
    }
    );
  }
}










// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
//
// import '../models/weather_model.dart';
// import '../services/weather_service.dart';
//
// class WeatherController extends GetxController {
//
//    final RxBool _isLoading = true.obs;
//    var lat = 21.028511.obs;
//    var lon = 105.804817.obs;
//
//   RxBool checkLoading() => _isLoading;
//
//   @override
//   void onInit() {
//     if (_isLoading.isTrue) {
//       getLocation();
//     }
//     super.onInit();
//   }
//
//   getLocation() async {
//     bool isServiceEnabled;
//     LocationPermission locationPermission;
//
//
//     isServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isServiceEnabled) {
//       Get.snackbar('Location error', 'Location is not enabled.');
//       return;
//     }
//
//     locationPermission = await Geolocator.checkPermission();
//     if (locationPermission == LocationPermission.deniedForever) {
//       Get.snackbar("Location error", "Location permission is denied.");
//     }
//     else if (locationPermission == LocationPermission.denied) {
//       locationPermission = await Geolocator.requestPermission();
//       if (locationPermission == LocationPermission.denied) {
//         Get.snackbar("Location error", "Location permission denied.");
//       }
//     }
//
//      await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high).then((value) {
//       lat.value = value.latitude;
//       lon.value = value.longitude;
//       _isLoading.value = false;
//     });
//   }
// }
//
