import 'package:geolocator/geolocator.dart';

class GetLocation {
  late String latitude;
  late String longitude;
  // Future<void> getCurrentPosition() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.deniedForever) {
  //       return Future.error('Location Not Available');
  //     }
  //   } else {
  //     permission = await Geolocator.requestPermission();
  //   }
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   latitude = position.latitude.toString();
  //   longitude = position.longitude.toString();
  // }
 Future <void> getCurrentPosition()async{
    Position position = await Geolocator.getCurrentPosition(
         desiredAccuracy: LocationAccuracy.low);
     latitude = position.latitude.toString();
     longitude = position.longitude.toString();

}
}