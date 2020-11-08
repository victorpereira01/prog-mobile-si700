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
    String path = directory.path + "financial_control.db";

    var db = await openDatabase(path, version: 1, onCreate: _createDb);

    return db;
  }

  _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT, sendNews INTEGER)");
  }

  insertUser(User user) async {
    Database db = await this.database;

    var result = await db.insert("users", user.toMap(), nullColumnHack: "id");

    return result;
  }

  getUsersMapList() async {
    Database db = await this.database;

    var result = await db.rawQuery("SELECT * FROM users");

    return result;
  }

  getUsersList() async {
    var usersMapList = await getUsersMapList();
    int count = usersMapList.length;
    List<User> usersList = List<User>();

    for (int i = 0; i < count; i++) {
      usersList.add(User.fromMap(usersMapList[i]));
    }

    return usersList;
  }

  getCount() async {
    Database db = await this.database;

    var x = await db.rawQuery("SELECT COUNT(*) FROM users");

    int result = Sqflite.firstIntValue(x);

    return result;
  }
}
