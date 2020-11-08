class User {
  int _id;
  String _email;
  String _password;
  int _sendNews;

  User(this._email, this._password, this._sendNews);

  User.withId(this._id, this._email, this._password, this._sendNews);

  User.fromMap(map) {
    this._id = map["id"];
    this._email = map["email"];
    this._password = map["password"];
    this._sendNews = map["sendNews"];
  }

  int get id => _id;

  String get email => _email;

  String get password => _password;

  int get sendNews => _sendNews;

  set email(String newEmail) {
    this._email = email;
  }

  set password(String newPassword) {
    this._password = newPassword;
  }

  set sendNews(int newSendNews) {
    this._sendNews = newSendNews;
  }

  toMap() {
    var map = Map<String, dynamic>();

    if (map["id"] != null) {
      map["id"] = _id;
    }
    map["email"] = _email;
    map["password"] = _password;
    map["sendNews"] = _sendNews;
  }
}
