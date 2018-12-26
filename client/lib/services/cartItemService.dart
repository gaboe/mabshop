import 'package:mobshop/models/cartItem.dart';
import 'package:sqflite/sqflite.dart';

class CartItemService {
  Future<Database> _open(String path) async {
    var db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
                                  create table $cartItemsTable ( 
                                    $columnId integer primary key autoincrement, 
                                    $columnProductID integer not null,
                                    $columnProductName text not null,
                                    $columnQuantity integer not null,
                                    $columnPrice real not null
                                    )
                                  ''');
    });
    return db;
  }

  Future<CartItem> addToCart(CartItem cartItem) async {
    var prevCartItem = await getCartItem(cartItem.productID);
    if (prevCartItem != null) {
      prevCartItem.price += cartItem.price;
      prevCartItem.quantity++;
      await update(prevCartItem);
      return prevCartItem;
    }
    return insert(cartItem);
  }

  Future<CartItem> insert(CartItem cartItem) async {
    cartItem.id =
        await execute((db) => db.insert(cartItemsTable, cartItem.toMap()));
    return cartItem;
  }

  Future<List<CartItem>> getCartItems() async {
    var items = execute((f) async {
      List<Map> list = await f.rawQuery('SELECT * FROM $cartItemsTable');
      return list.map((x) => CartItem.fromMap(x)).toList();
    });

    return items;
  }

  Future<CartItem> getCartItem(int productID) async {
    var cartItem = execute((db) async {
      List<Map> maps = await db.query(cartItemsTable,
          columns: [
            columnId,
            columnProductID,
            columnProductName,
            columnPrice,
            columnQuantity
          ],
          where: '$columnProductID = ?',
          whereArgs: [productID]);
      if (maps.length > 0) {
        return CartItem.fromMap(maps.first);
      }
      return null;
    });

    return cartItem;
  }

  Future<int> delete(int id) async {
    return execute((db) =>
        db.delete(cartItemsTable, where: '$columnId = ?', whereArgs: [id]));
  }

  Future deleteAll() async {
    return execute((db) => db.delete(cartItemsTable));
  }

  Future<int> update(CartItem cartItem) async {
    return execute<int>((d) => d.update(cartItemsTable, cartItem.toMap(),
        where: '$columnId = ?', whereArgs: [cartItem.id]));
  }

  Future _close(Database db) async => db.close();

  Future<T> execute<T>(Future<T> f(Database db)) async {
    var path = await getDatabasesPath() + "mobshop.db";
    var db = await _open(path);
    T data;
    try {
      data = await f(db);
    } finally {
      await _close(db);
    }
    return data;
  }

  Future finishOrder() async {
    var items = await getCartItems();
    var orderNumber = items.fold("", (n, e) => "$n${e.id}");
    await deleteAll();
    return orderNumber;
  }
}
