import 'package:mobshop/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final response =
        await http.get('https://mobshop-server.herokuapp.com/api/products');

    if (response.statusCode == 200) {
      List list = json.decode(response.body);
      List<Product> products =
          list.map((model) => Product.fromJson(model)).toList();
      return products.toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
