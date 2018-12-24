import 'package:flutter/material.dart';
import 'package:mobshop/models/product.dart';

class Grid {
  GridView build(List<Product> products) {
    return new GridView.count(
        primary: true,
        padding: const EdgeInsets.all(1.0),
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: products
            .map((p) => getStructuredGridCell(p.name, p.name))
            .toList());
  }

  Card getStructuredGridCell(name, image) {
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Image.network(
              image,
            ),
            new Center(child: Text(name))
          ],
        ));
  }
}
