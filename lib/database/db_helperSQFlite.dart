import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import '../components/cart_model.dart';

// ignore: camel_case_types
class DBHelper {
  static Database? _db;
  // ignore: body_might_complete_normally_nullable
  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart_db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY AUTOINCREMENT, productId INTEGER, productName TEXT, initialPrice REAL, productPrice REAL, quantity INTEGER, image TEXT)');
  }

  // Future<Cart> insert(Cart cart) async {
  //   var dbClient = _db;
  //   await dbClient?.insert('cart', cart.toMap());
  //   return cart;
  // }

  Future<Cart> insert(Cart cart) async {
    var dbClient = await _db;

    if (dbClient == null) {
      // Handle the case where the database client is null
      return cart; // Return the input cart or throw an appropriate error
    }

    await dbClient.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await db;

    if (dbClient == null) {
      // Handle the case where the database client is null
      return []; // Return an empty list or throw an appropriate error
    }

    final List<Map<String, Object?>> queryResult = await dbClient.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await db;
    return await dbClient!.update(
      'cart',
      cart.toMap(),
      where: 'id = ?',
      whereArgs: [cart.id],
    );
  }
}
