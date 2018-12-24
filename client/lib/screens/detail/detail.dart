import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobshop/models/product.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final Product product;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text("${product.name}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${product.smallDescription}'),
      ),
    );
  }
}
