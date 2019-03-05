class Category {
  int _id;
  String _name;
  String _value;
  int _timestamp;

  Category(this._name, this._timestamp);

  Category.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._value = obj['value'];
    this._timestamp = obj['timestamp'];
  }

  int get id => _id;
  String get name => _name;
  String get value => _value;
  int get timestamp => _timestamp;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['value'] = _value;
    map['timestamp'] = _timestamp;

    return map;
  }

  Category.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._value = map['value'];
    this._timestamp = map['timestamp'];
  }
}
