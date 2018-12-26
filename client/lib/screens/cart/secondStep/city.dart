import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobshop/models/locationIq.dart';

class City extends StatelessWidget {
  const City({
    Key key,
    @required Future<LocationIQAddress> location,
  })  : _location = location,
        super(key: key);

  final Future<LocationIQAddress> _location;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _location,
      builder: (ctx, AsyncSnapshot<LocationIQAddress> snapshot) {
        if (snapshot.hasData) {
          var city = snapshot.data.cityDistrict != null
              ? snapshot.data.cityDistrict
              : snapshot.data.city;
          return buildTextFormField(city, city);
        } else {
          return buildTextFormField(null, "empty-city");
        }
      },
    );
  }

  TextFormField buildTextFormField(String postcode, String key) {
    return TextFormField(
      key: Key(key),
      initialValue: postcode,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "City",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your city';
        }
      },
    );
  }
}
