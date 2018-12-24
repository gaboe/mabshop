import 'package:flutter/material.dart';
import 'package:mobshop/screens/cart/cart.dart';
import 'package:mobshop/screens/catalogue/catalogue.dart';
import 'package:mobshop/screens/home.dart';

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
        CartPage.routeName: (BuildContext context) => new CartPage()
      },
    );
  }
}
