import 'package:flutter/material.dart';
import 'package:mobshop/models/product.dart';
import 'package:mobshop/screens/cart/cartIcon.dart';

import 'package:mobshop/screens/catalogue/grid.dart';
import 'package:mobshop/services/productService.dart';

class CataloguePage extends StatelessWidget {
  static const String routeName = "/catalogue";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Products"),
        backgroundColor: Colors.blue,
        actions: <Widget>[CartIcon()],
      ),
      body: Container(
          child: FutureBuilder<List<Product>>(
        future: ProductService.fetchProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Grid().build(context, snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                CircularProgressIndicator(),
                Text("Loading products")
              ],
            ),
          );
        },
      )),
    );
  }
}
