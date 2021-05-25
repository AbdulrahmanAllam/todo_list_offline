class Category {
  int _id;
  String _name;
  String _color;

  Category.fromMap(Map<String, dynamic> map) {
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
  String get color => _color;
}
