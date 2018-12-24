final String cartItemsTable = 'cartItems';
final String columnId = '_id';
final String columnProductID = 'productID';
final String columnProductName = 'productName';
final String columnPrice = 'price';
final String columnQuantity = 'quantity';

class CartItem {
  int id;
  int productID;
  String productName;
  num price;
  int quantity;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnProductID: productID,
      columnProductName: productName,
      columnPrice: price,
      columnQuantity: quantity
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  CartItem();

  CartItem.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    productID = map[columnProductID];
    productName = map[columnProductName];
    price = map[columnPrice];
    quantity = map[columnQuantity];
  }
}
