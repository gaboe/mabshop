import 'package:flutter/material.dart';
import 'package:mobshop/screens/catalogue/catalogue.dart';

class ThirdStep extends StatelessWidget {
  static const String routeName = "/thirdStep";

  final String orderNumber;

  const ThirdStep({Key key, this.orderNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finished order"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: new Text(
                    "Thank you for your order. If you have any questions, contact us!",
                    style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: new Text("Your order number is $orderNumber",
                    style: new TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: RaisedButton.icon(
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                  color: Colors.white,
                ),
                label: Text(
                  'Catalogue',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    CataloguePage.routeName, (_) => false),
                color: Colors.greenAccent[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
