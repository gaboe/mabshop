import 'package:flutter/material.dart';
import 'package:mobshop/models/cartItem.dart';
import 'package:mobshop/services/cartItemService.dart';

class CartPage extends StatelessWidget {
  static const String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    var service = new CartItemService();
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: FutureBuilder<List<CartItem>>(
          future: service.getCartItems(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data
                    .map((cartItem) => ListTile(
                          leading: Icon(Icons.close),
                          title: Text(cartItem.productName),
                        ))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Text("Error");
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
