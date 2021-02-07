import 'package:geolocator/geolocator.dart';

class Location {
  Location();

  Future<Position> getCurrentLocation() async {
    Geolocator geoloc = Geolocator();
    try {
      Position position = await geoloc.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);

      return position;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
