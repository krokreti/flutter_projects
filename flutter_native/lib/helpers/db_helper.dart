import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    //creating database;
    final dbPath = await sql.getDatabasesPath();
    //open abre um banco de dados ou cria um do zero
    return sql.openDatabase(
      path.join(dbPath, 'places.db'),
      //dbpath é a pasta do banco de dados, o path.join cria o caminho
      onCreate: (db, version) {
        //essa funçao é executada quando o sql procura o database e nao encontra uma
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();

    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
