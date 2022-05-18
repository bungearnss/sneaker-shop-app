import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'user_cart.db'),
        onCreate: ((db, version) {
      return db.execute(
          "CREATE TABLE user_cart(id TEXT PRIMARY KEY, model TEXT, price REAL, imgAddress TEXT, size REAL, unit TEXT, numOfItem INTEGER)");
    }), version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();

    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<void> delete(String table, String id) async {
    final db = await DBHelper.database();

    db.delete(table, where: "id = ?", whereArgs: [id]);
  }
}
