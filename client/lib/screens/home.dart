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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 100),
              child: Center(
                child: Text.rich(
                  TextSpan(
                      text:
                          "Welcome to MobShop, the best application for shoping on your smartphone."),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/catalogue');
              },
              iconSize: 60.0,
            )
          ],
        ),
      ),
    );
  }
}
