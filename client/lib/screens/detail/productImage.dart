import 'package:flutter/material.dart';
import 'package:mobshop/models/product.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Hero(
          tag: 'productDetailHero' + product.id.toString(),
          child: Image.network(
            product.imageUrl,
          ),
        ),
      ),
    );
  }
}
