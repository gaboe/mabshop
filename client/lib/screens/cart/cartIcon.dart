import 'package:flutter/material.dart';
import 'package:mobshop/screens/cart/firstStep.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_basket),
      onPressed: () {
        Navigator.of(context).pushNamed(FirstStep.routeName);
      },
    );
  }
}
