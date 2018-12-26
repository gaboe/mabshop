import 'package:flutter/material.dart';
import 'package:mobshop/models/locationIq.dart';
import 'package:mobshop/screens/cart/secondStep/city.dart';
import 'package:mobshop/screens/cart/secondStep/email.dart';
import 'package:mobshop/screens/cart/secondStep/fullName.dart';
import 'package:mobshop/screens/cart/secondStep/postalCode.dart';
import 'package:mobshop/services/locationService.dart';

class SecondStep extends StatefulWidget {
  static const String routeName = "/secondStep";

  @override
  SecondStepState createState() {
    return SecondStepState();
  }
}

class SecondStepState extends State<SecondStep> {
  final _formKey = GlobalKey<FormState>();
  Future<LocationIQAddress> _location;
  final LocationService _service = new LocationService();

  @override
  void initState() {
    super.initState();
    _location = _service.getCurrentLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Email(),
                FullName(),
                City(
                  location: _location,
                ),
                PostalCode(location: _location),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.greenAccent[700],
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Send order'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
