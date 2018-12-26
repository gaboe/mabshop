import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobshop/models/locationIq.dart';

class PostalCode extends StatelessWidget {
  const PostalCode({
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
          var postcode = snapshot.data.postcode;
          return buildTextFormField(postcode, postcode);
        } else {
          return buildTextFormField("", "empty-postalcode");
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
        labelText: "Postal code",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your postal code';
        }
      },
    );
  }
}
