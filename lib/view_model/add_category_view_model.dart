import 'package:flutter/cupertino.dart';
import 'package:todo_list_offline/services/const_names.dart';
import 'package:todo_list_offline/services/database_services.dart';
import 'package:todo_list_offline/utils/app_color.dart';

class AddCategoryViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  DatabaseServices _databaseServices = DatabaseServices();
  String categoryName;
  int categoryColor = AppColors.white.value;

  addCategory() async {
    try {
      List categories = await _databaseServices.reade(
          sql:
              "SELECT * FROM ${ConstNames.categoriesTable} WHERE ${ConstNames.categoryNameColumn} = ? OR ${ConstNames.categoryColorColumn} = ?",
          arguments: [categoryName, categoryColor]);

      if (categories.isNotEmpty) {
        print("this name is used");
        return false;
      } else {
        await _databaseServices.create(
            sql:
                'INSERT INTO ${ConstNames.categoriesTable}(${ConstNames.categoryNameColumn}, ${ConstNames.categoryColorColumn}) VALUES("$categoryName", $categoryColor)');
        return true;
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
