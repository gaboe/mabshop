import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final int id;
  final String name;

  Product({this.id, this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
    );
  }
}

class MyGridView {
  Card getStructuredGridCell(name, image) {
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Image.network(
              image,
            ),
            new Center(
              child: FutureBuilder<Product>(
                future: fetchPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.name);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            )
          ],
        ));
  }

  GridView build() {
    return new GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStructuredGridCell("Facebook", "https://loremflicker.com/200/300"),
        getStructuredGridCell("Twitter", "https://loremflicker.com/200/300"),
        getStructuredGridCell("Instagram", "http://loremflicker.com/200/300"),
        getStructuredGridCell(
            "Linkedin", "https://picsum.photos/200/300/?random"),
      ],
    );
  }

  Future<Product> fetchPost() async {
    final response =
        await http.get('https://mobshop-server.herokuapp.com/api/products');

    if (response.statusCode == 200) {
      List l = json.decode(response.body);
      List<Product> posts = l.map((model) => Product.fromJson(model)).toList();
      // If server returns an OK response, parse the JSON
      // return Product.fromJson(json.decode(response.body));
      return posts.toList()[0];
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
