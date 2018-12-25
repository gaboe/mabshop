import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            "Welcome to MobShop, we make shopping easy",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.w400,
                fontSize: 36.0),
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.blueAccent,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/catalogue');
            },
            iconSize: 60.0,
          )
        ],
      ),
    );
  }
}
