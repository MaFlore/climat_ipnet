import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  /*Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }*/
  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    this.latitude = position.latitude;
    this.longitude = position.longitude;
  }
}
