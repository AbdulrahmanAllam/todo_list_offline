import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_list_offline/services/const_names.dart';

class DatabaseServices<T> {
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
            "CREATE TABLE ${ConstNames.tasksTable}(${ConstNames.taskIdColumn} INTEGER PRIMARY KEY AUTOINCREMENT, ${ConstNames.taskNameColumn} TEXT, ${ConstNames.taskDescriptionColumn} TEXT, ${ConstNames.taskDoneColumn} INTEGER, ${ConstNames.taskCategoryIdColumn} INTEGER)");
        db.execute(
            "CREATE TABLE ${ConstNames.categoriesTable}(${ConstNames.categoryIdColumn} INTEGER PRIMARY KEY AUTOINCREMENT, ${ConstNames.categoryNameColumn} TEXT, ${ConstNames.categoryColorColumn} INTEGER)");
        db.insert(
          "${ConstNames.categoriesTable}",
          {
            "${ConstNames.categoryNameColumn}": "not categorized",
            "${ConstNames.categoryColorColumn}": 4294967295,
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

  Future<int> update({@required String sql, List arguments}) async {
    var db = await database;
    return db.rawUpdate(sql, arguments);
  }

  Future<int> delete({@required String sql, List arguments}) async {
    var db = await database;
    return db.rawDelete(sql, arguments);
  }
}
