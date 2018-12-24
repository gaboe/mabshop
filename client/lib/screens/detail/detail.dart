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
          padding: EdgeInsets.all(5.0),
          child: Container(
            child: ListView(
              children: <Widget>[
                buildImage(),
                buildText(),
                buildPrice(),
                buildAddToCartButton(),
                buildLongDescr(),
              ],
            ),
          )),
    );
  }

  Padding buildLongDescr() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(text: "Description:"),
              style: TextStyle(fontSize: 25),
            ),
          ),
          Text.rich(
            TextSpan(text: product.longDescription),
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  RaisedButton buildAddToCartButton() {
    return RaisedButton.icon(
      icon: Icon(
        Icons.add_shopping_cart,
        size: 20,
      ),
      label: Text("Add to cart"),
      onPressed: () {},
      color: Colors.greenAccent,
    );
  }

  Padding buildPrice() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Align(
        child: Text.rich(
          TextSpan(text: "${product.price} EUR"),
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }

  Padding buildText() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(text: product.name),
              style: TextStyle(fontSize: 30),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text.rich(
              TextSpan(text: "“${product.smallDescription}„"),
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  Container buildImage() {
    return Container(
      child: Center(
        child: Hero(
          tag: 'productDetailHero' + product.id.toString(),
          child: Image.network(
            product.imageUrl,
          ),
        ),
      ),
    );
  }
}
