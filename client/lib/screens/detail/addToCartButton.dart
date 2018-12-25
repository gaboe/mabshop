import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobshop/models/cartItem.dart';
import 'package:mobshop/models/product.dart';
import 'package:mobshop/services/cartItemService.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  const AddToCartButton({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(
        Icons.add_shopping_cart,
        size: 20,
      ),
      label: Text("Add to cart"),
      onPressed: () => addToCart(),
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
