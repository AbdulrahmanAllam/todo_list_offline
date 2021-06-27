import 'package:flutter/cupertino.dart';
import 'package:todo_list_offline/services/const_names.dart';
import 'package:todo_list_offline/services/database_services.dart';

class AddTaskViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  DatabaseServices _databaseServices = DatabaseServices();
  String _taskName;
  String _taskDescription = '';
  int _categoryId = 1;

  Future<List> getCategories() async {
    return await _databaseServices.reade(
        sql: "SELECT * FROM ${ConstNames.categoriesTable}");
  }

  Future<int> addTask() async {
    return await _databaseServices.create(
        sql:
            'INSERT INTO ${ConstNames.tasksTable}(${ConstNames.taskNameColumn}, ${ConstNames.taskDescriptionColumn}, ${ConstNames.taskDoneColumn}, ${ConstNames.taskCategoryIdColumn}) VALUES("$_taskName", "$_taskDescription", 0, $_categoryId)');
  }

  int get categoryId => _categoryId;

  set taskName(String name) {
    _taskName = name;
    notifyListeners();
  }

  set categoryId(int id) {
    _categoryId = id;
    notifyListeners();
  }

  set taskDescription(String description) {
    _taskDescription = description;
    notifyListeners();
  }
}
