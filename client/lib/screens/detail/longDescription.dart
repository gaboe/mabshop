import 'package:flutter/widgets.dart';
import 'package:mobshop/models/product.dart';

class LongDescription extends StatelessWidget {
  const LongDescription({
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
              TextSpan(text: "Description:"),
              style: TextStyle(fontSize: 25),
            ),
          ),
          Text.rich(
            TextSpan(text: product.longDescription),
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
