import 'package:flutter/material.dart';
import 'package:mobshop/models/product.dart';
import 'package:mobshop/screens/detail/detail.dart';

class Grid {
  GridView build(BuildContext context, List<Product> products) {
    return new GridView.count(
        primary: true,
        padding: const EdgeInsets.all(1.0),
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children:
            products.map((p) => getStructuredGridCell(context, p)).toList());
  }

  Card getStructuredGridCell(BuildContext context, Product product) {
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            product: product,
                          ),
                    ),
                  );
                },
                child: Image.network(
                  product.imageUrl,
                ),
              ),
            ),
            new Center(child: Text(product.name))
          ],
        ));
  }
}
