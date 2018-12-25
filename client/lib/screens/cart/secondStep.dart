import 'package:flutter/material.dart';
import 'package:mobshop/models/locationIq.dart';
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
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "test@email.com",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email address';
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Full name",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your name';
                    }
                  },
                ),
                FutureBuilder(
                  future: _location,
                  builder: (ctx, AsyncSnapshot<LocationIQAddress> snapshot) {
                    if (snapshot.hasData) {
                      var postcode = snapshot.data.postcode;
                      return TextFormField(
                        key: Key(postcode),
                        initialValue: postcode,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Postal code",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                        },
                      );
                    } else {
                      return TextFormField(
                        key: Key("empty"),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Postal code",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                        },
                      );
                    }
                  },
                ),
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
