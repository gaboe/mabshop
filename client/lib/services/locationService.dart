import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobshop/models/locationIq.dart';
import 'package:location/location.dart';

class LocationService {
  Future<LocationIQAddress> getCurrentLocationData() async {
    var location = new Location();
    var currentLocation = await location.getLocation();
    var lat = currentLocation["latitude"];
    var lon = currentLocation["longitude"];
    final response = await http.get(
        'https://locationiq.org/v1/reverse.php?key=d2d32e4b1240c8&lat=$lat&lon=$lon&format=json');

    if (response.statusCode == 200) {
      var obj = json.decode(response.body);
      var address = obj["address"];

      return LocationIQAddress.fromJson(address);
    } else {
      throw Exception('Failed to load location');
    }
  }
}
