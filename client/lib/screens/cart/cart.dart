import 'package:flutter/material.dart';
import 'package:mobshop/models/cartItem.dart';
import 'package:mobshop/services/cartItemService.dart';

class CartPage extends StatefulWidget {
  static const String routeName = "/cart";

  @override
  CartPageState createState() {
    return new CartPageState();
  }
}

class CartPageState extends State<CartPage> {
  Future<List<CartItem>> _cartItems;
  var _service = new CartItemService();

  @override
  void initState() {
    super.initState();
    _cartItems = _service.getCartItems();
  }

  void _refreshList() {
    setState(() {
      _cartItems = _service.getCartItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: FutureBuilder<List<CartItem>>(
        future: _cartItems,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data
                  .map((cartItem) => ListTile(
                        leading: GestureDetector(
                            onTap: () async {
                              await _service.delete(cartItem.id);
                              _refreshList();
                            },
                            child: Icon(Icons.close)),
                        title: Text(cartItem.productName),
                      ))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
