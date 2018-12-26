import 'package:flutter/material.dart';
import 'package:mobshop/models/cartItem.dart';
import 'package:mobshop/screens/cart/secondStep/secondStep.dart';
import 'package:mobshop/services/cartItemService.dart';

class FirstStep extends StatefulWidget {
  static const String routeName = "/firstStep";

  @override
  FirstStepState createState() {
    return new FirstStepState();
  }
}

class FirstStepState extends State<FirstStep> {
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
            var cartItems = snapshot.data
                .map((cartItem) => Card(
                        child: ListTile(
                      leading: GestureDetector(
                          onTap: () async {
                            await _service.delete(cartItem.id);
                            final snackBar = SnackBar(
                              content: Text(
                                  '${cartItem.productName} was removed from cart'),
                              backgroundColor: Colors.red,
                              duration: new Duration(seconds: 2),
                            );
                            Scaffold.of(ctx).showSnackBar(snackBar);
                            _refreshList();
                          },
                          child: Icon(
                            Icons.close,
                            size: 40,
                          )),
                      title:
                          Text("${cartItem.productName} ${cartItem.quantity}x"),
                      subtitle: Text("${cartItem.price} EUR"),
                    )))
                .toList();
            var sum =
                snapshot.data.map((e) => e.price).fold(0, (e, sum) => e + sum);
            return new Column(children: <Widget>[
              buildContactButton(context, snapshot.data),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  child: new Text("Summary ${sum.toStringAsFixed(2)} EUR",
                      style: new TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              buildEmptyCartWarning(snapshot.data),
              Expanded(child: ListView(children: cartItems))
            ]);
          } else if (snapshot.hasError) {
            return Text("Error");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget buildContactButton(BuildContext context, List<CartItem> cartItems) {
    if (cartItems.length == 0)
      return Container();
    else
      return Align(
        alignment: Alignment.topRight,
        child: RaisedButton.icon(
          icon: Icon(
            Icons.keyboard_arrow_right,
            size: 20,
            color: Colors.white,
          ),
          label: Text(
            'Contact',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () =>
              Navigator.of(context).pushNamed(SecondStep.routeName),
          color: Colors.greenAccent[700],
        ),
      );
  }

  Widget buildEmptyCartWarning(List<CartItem> cartItems) {
    if (cartItems.length > 0)
      return Container();
    else
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          child:
              new Text("Your cart is empty, go to catalogue and buy something",
                  style: new TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
        ),
      );
  }
}
