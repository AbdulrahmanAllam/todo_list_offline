class TaskModel {
  int _id;
  String _name;
  int _done;
  int _categoryColor;

  TaskModel.fromMap(Map<String, dynamic> map) {
    _id = map["id"];
    _name = map["name"];
    _done = map["done"];
    _categoryColor = map["categoryColor"];
  }

  Map<String, dynamic> toMap() => {
        "id": _id,
        "name": _name,
        "done": _done,
        "categoryColor": _categoryColor,
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
  int get categoryColor => _categoryColor;
}
