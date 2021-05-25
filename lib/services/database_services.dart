import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServices {
  ////////////////////////singletone///////////////////////
  DatabaseServices._internal();

  static final DatabaseServices _instance = DatabaseServices._internal();

  factory DatabaseServices() {
    return _instance;
  }
  ////////////////////////singletone///////////////////////

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _createDatebase();

    return _database;
  }

  Future<Database> _createDatebase() async {
    String path = join(await getDatabasesPath(), "todo_list.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, done INTEGER, category TEXT)");
        db.execute(
            "CREATE TABLE categories(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, color TEXT)");
        db.insert(
          "categories",
          {
            "name": "not categorized",
            "color": "0xFFFFFF",
          },
        );
      },
    );
  }

  /////////////////////-----------------------CRUD-----------------////////////////////
  Future<int> create({@required String sql, List arguments}) async {
    var db = await database;
    return db.rawInsert(sql, arguments);
  }

  Future<List> reade({@required String sql, List arguments}) async {
    var db = await database;
    return db.rawQuery(sql, arguments);
  }

  Future<int> updata({@required String sql, List arguments}) async {
    var db = await database;
    return db.rawUpdate(sql, arguments);
  }

  Future<int> delete({@required String sql, List arguments}) async {
    var db = await database;
    return db.rawDelete(sql, arguments);
  }
}
