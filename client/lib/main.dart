import 'package:flutter/material.dart';
import 'package:mobshop/screens/cart/firstStep.dart';
import 'package:mobshop/screens/cart/secondStep/secondStep.dart';
import 'package:mobshop/screens/catalogue/catalogue.dart';
import 'package:mobshop/screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'MobShop'),
      routes: <String, WidgetBuilder>{
        CataloguePage.routeName: (BuildContext context) => new CataloguePage(),
        FirstStep.routeName: (BuildContext context) => new FirstStep(),
        SecondStep.routeName: (BuildContext context) => new SecondStep()
      },
    );
  }
}
