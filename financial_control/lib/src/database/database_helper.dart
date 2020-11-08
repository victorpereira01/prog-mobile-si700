import 'dart:io';

import 'package:financial_control/src/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper helper = DatabaseHelper._createInstance();

  static Database _database;

  DatabaseHelper._createInstance();

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDatabase();
    }
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "app.db";

    var db = await openDatabase(path, version: 1, onCreate: _createDb);

    return db;
  }

  _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT, sendNews INTEGER)");
    await db.execute(
        "CREATE TABLE IF NOT EXISTS transactions (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, value DOUBLE, userId INTEGER, FOREIGN KEY(userId) REFERENCES users(id))");
  }

  insert(User user) async {
    Database db = await this.database;

    String userEmail = user.email;
    String userPassword = user.password;
    int sendNews = user.sendNews;

    await db.rawQuery(
        "INSERT INTO users (email, password, sendNews) VALUES ('$userEmail', '$userPassword', $sendNews)");
  }

  Future<User> getUser(String email, String password) async {
    Database db = await this.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM users WHERE email = '$email' AND password = '$password'");

    if (result.length > 0) {
      return new User.fromMap(result.first);
    }

    return null;
  }

  Future<List> getMapList() async {
    Database db = await this.database;

    var result = await db.rawQuery("SELECT * FROM users");

    return result.toList();
  }

  // getList() async {
  //   var mapList = await getMapList();
  //   int count = mapList.length;
  //   List<User> list = List<User>();

  //   for (int i = 0; i < count; i++) {
  //     list.add(User.fromMap(mapList[i]));
  //   }

  //   return list;
  // }

  getCount(String table) async {
    Database db = await this.database;

    var x = await db.rawQuery("SELECT COUNT(*) FROM $table");

    return Sqflite.firstIntValue(x);
  }
}
