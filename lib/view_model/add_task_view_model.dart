import 'package:flutter/cupertino.dart';
import 'package:todo_list_offline/services/database_services.dart';

class AddTaskViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  DatabaseServices _databaseServices = DatabaseServices();
  final String _tasksTable = "tasks";
  final String _categoriesTable = "categories";
  String _taskName;
  int _categoreColor;
  String _categoreName;

  setCategoryColorAndName(String name, int color) {
    if (name != null && color != null) {
      _categoreColor = color;
      _categoreName = name;
      notifyListeners();
    } else
      print("name or color is null");
  }

  removeCategory() {
    _categoreName = null;
    _categoreColor = null;
    notifyListeners();
  }

  Future<List> getCategories() async {
    return await _databaseServices.reade(
        sql: "SELECT * FROM $_categoriesTable");
  }

  Future<int> addTask() async {
    return await _databaseServices.create(
        sql:
            'INSERT INTO $_tasksTable(name, done, categoryColor) VALUES("$_taskName", 0, $categoreColor)');
  }

  String get categoreName => _categoreName;
  int get categoreColor => _categoreColor;

  set categoreColor(int color) => _categoreColor = color;
  set taskName(String name) {
    _taskName = name;
    notifyListeners();
  }
}
