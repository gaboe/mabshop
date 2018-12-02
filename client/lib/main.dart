import 'package:flutter/material.dart';
import 'package:mobshop/screens/home.dart';
import 'package:mobshop/screens/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'MobShop'),
      routes: <String, WidgetBuilder>{
        CataloguePage.routeName: (BuildContext context) => new CataloguePage()
      },
    );
  }
}
