import 'package:flutter/widgets.dart';
import 'package:mobshop/models/product.dart';

class ProductText extends StatelessWidget {
  const ProductText({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
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
}
