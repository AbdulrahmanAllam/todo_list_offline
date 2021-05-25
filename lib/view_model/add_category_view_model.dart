import 'package:flutter/cupertino.dart';
import 'package:todo_list_offline/services/database_services.dart';

class AddCategoryViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  DatabaseServices _databaseServices = DatabaseServices();
  String _categoriesTable = "categories";

  String categoryName;

  String categoryColor;

  Future<int> addCategory() async {
  await  _databaseServices.create(
        sql: 'INSERT INTO $_categoriesTable(name, color) VALUES("$categoryName", "$categoryColor")');
  }
}
