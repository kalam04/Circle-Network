import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static final dbName = "myDatabase.db";
  static final dbVersion = 1;
  static Database _database;

  static final tableName = 'myTable';
  static final columnId = "_id";
  static final columnName = "name";

  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    await openDatabase(path, version: dbVersion, onCreate: _onCreat);
  }

  Future _onCreat(Database db, int version) async {
    db.query(
        '''
      create table $tableName (
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL
      )
      '''
    );
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryall() async{
    Database db =await instance.database;
    return await db.query(tableName);

  }

}



