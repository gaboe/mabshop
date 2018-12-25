import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobshop/models/locationIq.dart';

class LocationService {
  Future<LocationIQAddress> getCurrentLocationData() async {
    final response = await http.get(
        'https://locationiq.org/v1/reverse.php?key=d2d32e4b1240c8&lat=49.2309195&lon=17.6582021&format=json');

    if (response.statusCode == 200) {
      var obj = json.decode(response.body);
      var address = obj["address"];

      return LocationIQAddress.fromJson(address);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
