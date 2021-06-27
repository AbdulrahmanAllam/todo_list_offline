import 'package:todo_list_offline/services/const_names.dart';

class TaskModel {
  int _id;
  String _name;
  int _done;
  int _categoryId;

  TaskModel.fromMap(Map<String, dynamic> map) {
    _id = map[ConstNames.taskIdColumn];
    _name = map[ConstNames.taskNameColumn];
    _done = map[ConstNames.taskDoneColumn];
    _categoryId = map[ConstNames.taskCategoryIdColumn];
  }

  Map<String, dynamic> toMap() => {
        ConstNames.taskIdColumn: _id,
        ConstNames.taskNameColumn: _name,
        ConstNames.taskDoneColumn: _done,
        ConstNames.taskCategoryIdColumn: _categoryId,
      };

  int get id => _id;
  bool get done {
    switch (_done) {
      case 1:
        return true;
        break;
      case 0:
        return false;
        break;
      default:
        return false;
    }
  }

  String get name => _name;
  int get categoryId => _categoryId;
}
