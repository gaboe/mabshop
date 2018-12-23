import 'package:flutter/material.dart';
import 'package:mobshop/models/product.dart';
import 'package:mobshop/screens/girdview.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      body: Container(
          child: FutureBuilder<List<Product>>(
        future: fetchProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return myGridView.build(snapshot.data);
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

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get('https://mobshop-server.herokuapp.com/api/products');

  if (response.statusCode == 200) {
    List list = json.decode(response.body);
    List<Product> products =
        list.map((model) => Product.fromJson(model)).toList();
    return products.toList();
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
