import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "qwe123.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(createMovieTable(POPULAR_MOVIES_TABLE));
      await db.execute(createMovieTable(TOP_RATED_MOVIES_TABLE));
    });
  }
}

String createMovieTable(String tableName) {
  return "CREATE TABLE IF NOT EXISTS " +
      tableName +
      "("
          "id INTEGER PRIMARY KEY,"
          "poster_path TEXT,"
          "overview TEXT,"
          "original_title TEXT,"
          "type TEXT)";
}

const String POPULAR_MOVIES_TABLE = "POPULAR_MOVIES";
const String TOP_RATED_MOVIES_TABLE = "TOP_RATED_MOVIES";
