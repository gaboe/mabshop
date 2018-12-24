import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobshop/models/product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  DetailScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${product.name}"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: 'productDetailHero' + product.id.toString(),
                    child: Image.network(
                      product.imageUrl,
                    ),
                  ),
                ),
                Text('${product.smallDescription}'),
              ],
            ),
          )),
    );
  }
}
