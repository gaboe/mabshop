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
                                    $columnPrice real not null
                                    )
                                  ''');
    });
    return db;
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

  // Future<CartItem> getCartItem(int productID) async {
  //   List<Map> maps = await db.query(cartItemsTable,
  //       columns: [columnId, columnProductID, columnProductName, columnPrice],
  //       where: '$columnProductID = ?',
  //       whereArgs: [productID]);
  //   if (maps.length > 0) {
  //     return CartItem.fromMap(maps.first);
  //   }
  //   return null;
  // }

  // Future<int> delete(int id) async {
  //   return await db
  //       .delete(cartItemsTable, where: '$columnId = ?', whereArgs: [id]);
  // }

  Future<int> update(CartItem todo) async {
    return execute<int>((d) => d.update(cartItemsTable, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]));
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
}
