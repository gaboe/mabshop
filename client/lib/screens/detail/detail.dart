import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobshop/models/product.dart';
import 'package:mobshop/screens/cart/cartIcon.dart';
import 'package:mobshop/screens/detail/addToCartButton.dart';
import 'package:mobshop/screens/detail/longDescription.dart';
import 'package:mobshop/screens/detail/price.dart';
import 'package:mobshop/screens/detail/productImage.dart';
import 'package:mobshop/screens/detail/productText.dart';
import 'package:mobshop/services/blocProvider.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  DetailScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${product.name}"),
        actions: <Widget>[CartIcon()],
      ),
      body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            child: ListView(
              children: <Widget>[
                ProductImage(product: product),
                ProductText(product: product),
                Price(product: product),
                BlocProvider<AddToCartBloc>(
                    child: AddToCartButton(
                      product: product,
                    ),
                    bloc: AddToCartBloc()),
                LongDescription(product: product),
              ],
            ),
          )),
    );
  }
}
