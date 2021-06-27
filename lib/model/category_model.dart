import 'package:todo_list_offline/services/const_names.dart';

class CategoryModel {
  int _id;
  String _name;
  int _color;

  CategoryModel.fromMap(Map<String, dynamic> map) {
    _id = map[ConstNames.categoryIdColumn];
    _name = map[ConstNames.categoryNameColumn];
    _color = map[ConstNames.categoryColorColumn];
  }

  Map<String, dynamic> toMap() => {
        ConstNames.categoryIdColumn: _id,
        ConstNames.categoryNameColumn: _name,
        ConstNames.categoryColorColumn: _color,
      };

  int get id => _id;
  String get name => _name;
  int get color => _color;
}
