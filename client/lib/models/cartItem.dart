final String cartItemsTable = 'cartItems';
final String columnId = '_id';
final String columnProductID = 'productID';
final String columnProductName = 'productName';
final String columnPrice = 'price';

class CartItem {
  int id;
  int productID;
  String productName;
  num price;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnProductID: productID,
      columnProductName: productName,
      columnPrice: price,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  CartItem();

  CartItem.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    productID = map[productID];
    productName = map[columnProductName];
    price = map[columnPrice];
  }
}
