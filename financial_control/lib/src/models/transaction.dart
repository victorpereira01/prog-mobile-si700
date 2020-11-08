class Transaction {
  String _name;
  double _value;
  int _userId;

  Transaction(this._name, this._value, this._userId);

  Transaction.fromMap(map) {
    this._name = map["name"];
    this._value = map["value"];
    this._userId = map["userId"];
  }

  String get name => _name;

  double get value => _value;

  int get userId => _userId;

  set name(String newName) {
    this._name = newName;
  }

  set value(double newValue) {
    this._value = newValue;
  }

  set userId(int newUserId) {
    this._userId = newUserId;
  }

  toMap() {
    var map = Map<String, dynamic>();

    map["name"] = _name;
    map["value"] = _value;
    map["userId"] = _userId;
  }
}
