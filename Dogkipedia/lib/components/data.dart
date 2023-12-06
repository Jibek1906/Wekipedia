import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'dogkipedia.db');

    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT
        )
      ''');
    });
  }

  Future<void> insertUser(String username, String password) async {
    final db = await database;
    await db.insert('users', {'username': username, 'password': password});
  }

  Future<bool> checkUserCredentials(String username, String password) async {
    final db = await database;
    final result = await db.query('users', where: 'username = ? AND password = ?', whereArgs: [username, password]);
    return result.isNotEmpty;
  }
}
