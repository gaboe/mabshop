import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CataloguePage extends StatelessWidget {
  static const String routeName = "/catalogue";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Products"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Text("produkt"),
      ),
    );
  }
}
