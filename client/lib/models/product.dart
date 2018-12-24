class Product {
  final int id;
  final String name;
  final num price;
  final String smallDescription;
  final String longDescription;
  final String imageUrl;

  Product(
      {this.id,
      this.name,
      this.price,
      this.smallDescription,
      this.longDescription,
      this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json["price"],
      smallDescription: json["smallDescription"],
      longDescription: json["longDescription"],
      imageUrl: json["imageUrl"],
    );
  }
}
