class CategoryModel {
  int _id;
  String _name;
  int _color;

  CategoryModel.fromMap(Map<String, dynamic> map) {
    _id = map["id"];
    _name = map["name"];
    _color = map["color"];
  }

  Map<String, dynamic> toMap() => {
        "id": _id,
        "name": _name,
        "color": _color,
      };

  int get id => _id;
  String get name => _name;
  int get color => _color;
}
