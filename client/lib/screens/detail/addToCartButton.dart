import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobshop/models/cartItem.dart';
import 'package:mobshop/models/product.dart';
import 'package:mobshop/services/blocProvider.dart';
import 'package:mobshop/services/cartItemService.dart';
import 'package:rxdart/rxdart.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  const AddToCartButton({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddToCartBloc bloc = BlocProvider.of<AddToCartBloc>(context);
    return RaisedButton.icon(
      icon: Icon(
        Icons.add_shopping_cart,
        size: 20,
        color: Colors.white,
      ),
      label: Text(
        'Add to cart',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        bloc.addToCart.add(product);
        final snackBar = SnackBar(
          content: Text('${product.name} was added to cart'),
          backgroundColor: Colors.greenAccent[400],
          duration: new Duration(seconds: 2),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      color: Colors.greenAccent[700],
    );
  }

  Future<CartItem> addToCart() async {
    var item = new CartItem();
    item.price = product.price;
    item.productID = product.id;
    item.productName = product.name;
    item.quantity = 1;
    return new CartItemService().addToCart(item);
  }
}

class AddToCartBloc implements BlocBase {
  StreamController<Product> _actionController = StreamController();
  StreamSink<Product> get addToCart => _actionController.sink;

  AddToCartBloc() {
    new Observable(_actionController.stream)
        .throttle(new Duration(milliseconds: 200))
        .listen(_handleLogic);
  }

  void dispose() {
    _actionController.close();
  }

  void _handleLogic(Product product) {
    var item = new CartItem();
    item.price = product.price;
    item.productID = product.id;
    item.productName = product.name;
    item.quantity = 1;
    new CartItemService().addToCart(item);
  }
}
