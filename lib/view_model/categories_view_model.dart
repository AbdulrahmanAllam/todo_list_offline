import 'package:flutter/cupertino.dart';
import 'package:todo_list_offline/services/database_services.dart';

class CategorieViewModel extends ChangeNotifier {
  DatabaseServices _databaseServices = DatabaseServices();
  String _categoriesTable = "categories";

  Future<List> getAllCategories() async {
    return await _databaseServices.reade(
        sql: "SELECT * FROM $_categoriesTable");
  }

  updateView() {
    notifyListeners();
  }
}
