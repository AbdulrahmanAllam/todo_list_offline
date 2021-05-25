import 'package:flutter/cupertino.dart';
import 'package:todo_list_offline/services/database_services.dart';

class HomeViewModel extends ChangeNotifier {
  DatabaseServices _databaseServices = DatabaseServices();
  List<String> _popupMenuList = ["Delete Completed", "Categories"];
  List<String> get popupMenuList => _popupMenuList;
  String _tasksTable = 'tasks';

  

  updateView() {
    notifyListeners();
  }

  Future<List> getTasks() async {
    return await _databaseServices.reade(sql: "SELECT * FROM $_tasksTable ORDER BY done");
  }

  checkTask(int id, int done) async {
    if (done == 0) {
      done = 1;
    } else if (done == 1) {
      done = 0;
    } else {
      done = 0;
    }
    await _databaseServices.updata(
        sql: "UPDATE $_tasksTable SET done = ? WHERE id = ?",
        arguments: [done, id]);
    notifyListeners();
  }

  deleteSelectedTasks() async {
    await _databaseServices
        .delete(sql: "DELETE FROM $_tasksTable WHERE done = ?", arguments: [1]);
    notifyListeners();
  }
}
