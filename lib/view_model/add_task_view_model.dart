import 'package:flutter/cupertino.dart';
import 'package:todo_list_offline/services/database_services.dart';

class AddTaskViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  DatabaseServices _databaseServices = DatabaseServices();
  String _tasksTable = "tasks";
  String _categoriesTable = "categories";

  String taskName;

  // getCategory() {
  //   _databaseServices.reade(sql: "SELECT name FROM $_categoriesTable");
  // }

  Future<int> addTask() async {
    return await _databaseServices.create(
        sql:
            'INSERT INTO $_tasksTable(name, done, category) VALUES("$taskName", 0, "not categorized")');
  }
}
