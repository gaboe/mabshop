import 'package:flutter/material.dart';
import 'package:mobshop/screens/girdview.dart';

class CataloguePage extends StatelessWidget {
  static const String routeName = "/catalogue";

  @override
  Widget build(BuildContext context) {
    final MyGridView myGridView = new MyGridView();

    return new Scaffold(
      // AppBar
      appBar: new AppBar(
        // Title
        title: new Text("Products"),
        // App Bar background color
        backgroundColor: Colors.blue,
      ),
      // Body
      body: myGridView.build(),
    );
  }
}
