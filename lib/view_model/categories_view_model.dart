import 'package:flutter/cupertino.dart';
import 'package:todo_list_offline/services/const_names.dart';
import 'package:todo_list_offline/services/database_services.dart';

class CategorieViewModel extends ChangeNotifier {
  DatabaseServices _databaseServices = DatabaseServices();

  Future<List> getAllCategories() async {
    return await _databaseServices.reade(
        sql: "SELECT * FROM ${ConstNames.categoriesTable}");
  }
}
