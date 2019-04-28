import 'dart:async';
import 'dart:io';

import 'package:logopeds_movies/pojo/Movie.dart';
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
    String path = join(documentsDirectory.path, "MOVIEDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE IF NOT EXISTS MOVIES ("
          "id INTEGER PRIMARY KEY,"
          "poster_path TEXT,"
          "overview TEXT,"
          "original_title TEXT,"
          "type TEXT,"
          ")");
    });
  }

  void insertMovies(List<Movie> movies) async {
    final Database db = await database;
    movies.forEach((f) {
      db.insert("MOVIES", f.movieToJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<Movie>> getAllClients() async {
    final db = await database;
    var res = await db.query("MOVIES");
    List<Movie> list =
        res.isNotEmpty ? res.map((c) => Movie.fromJson(c)).toList() : [];
    return list;
  }
}
