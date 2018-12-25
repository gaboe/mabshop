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
      ),
      label: Container(
        child: StreamBuilder<int>(
            stream: bloc.outCounter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('Add to cart me: ${snapshot.data} times');
            }),
      ),
      onPressed: () => bloc.incrementCounter.add(null), // addToCart(),
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
  int _counter;

  //
  // Stream to handle the counter
  //
  StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  //
  // Stream to handle the action on the counter
  //
  StreamController _actionController = StreamController();
  StreamSink get incrementCounter => _actionController.sink;

  AddToCartBloc() {
    _counter = 0;
    new Observable(_actionController.stream)
        .throttle(new Duration(milliseconds: 200))
        .listen(_handleLogic);
  }

  void dispose() {
    _actionController.close();
    _counterController.close();
  }

  void _handleLogic(data) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }
}
