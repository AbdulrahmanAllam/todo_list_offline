class TaskModel {
  int _id;
  String _name;
  int _done;
  String _category;

  TaskModel.fromMap(Map<String, dynamic> map) {
    _id = map["id"];
    _name = map["name"];
    _done = map["done"];
    _category = map["category"];
  }

  Map<String, dynamic> toMap() => {
        "id": _id,
        "name": _name,
        "done": _done,
        "category": _category,
      };

  int get id => _id;
  int get done => _done;
  String get name => _name;
  String get category => _category;
}
