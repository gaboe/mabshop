import 'package:flutter/widgets.dart';
import 'package:mobshop/models/product.dart';

class Price extends StatelessWidget {
  const Price({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
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
}
