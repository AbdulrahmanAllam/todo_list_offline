import 'package:flutter/cupertino.dart';
import 'package:todo_list_offline/services/const_names.dart';
import 'package:todo_list_offline/services/database_services.dart';

class HomeViewModel extends ChangeNotifier {
  DatabaseServices _databaseServices = DatabaseServices();
  List<String> _popupMenuList = ["Delete Completed", "Categories"];

  Future<List> getTasks() async {
    var res = await _databaseServices.reade(
        sql:
            "SELECT * FROM ${ConstNames.tasksTable} LEFT JOIN ${ConstNames.categoriesTable} ON ${ConstNames.tasksTable}.${ConstNames.taskCategoryIdColumn} = ${ConstNames.categoriesTable}.${ConstNames.categoryIdColumn} ORDER BY ${ConstNames.taskDoneColumn}");
    print(res);
    return res;
  }

  checkTask(int id, bool check) async {
    int done = 0;
    if (check) {
      done = 1;
    } else {
      done = 0;
    }
    await _databaseServices.update(
        sql: "UPDATE ${ConstNames.tasksTable} SET ${ConstNames.taskDoneColumn} = ? WHERE ${ConstNames.taskIdColumn} = ?",
        arguments: [done, id]);
    notifyListeners();
  }

  deleteSelectedTasks() async {
    await _databaseServices
        .delete(sql: "DELETE FROM ${ConstNames.tasksTable} WHERE ${ConstNames.taskDoneColumn} = ?", arguments: [1]);
    notifyListeners();
  }

  List<String> get popupMenuList => _popupMenuList;
}
