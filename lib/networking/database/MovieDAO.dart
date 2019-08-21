import 'package:logopeds_movies/networking/database/DbProvider.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:sqflite/sqflite.dart';

class MovieDao implements IMoviesDao {
  @override
  Future<List<Movie>> getPopularMovies() {
    return DBProvider.db.database.then((db) async {
      var res = await db.query(POPULAR_MOVIES_TABLE);
      return res.isNotEmpty ? res.map((c) => Movie.fromJson(c)).toList() : [];
    });
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    return DBProvider.db.database.then((db) async {
      var res = await db.query(TOP_RATED_MOVIES_TABLE);
      return res.isNotEmpty ? res.map((c) => Movie.fromJson(c)).toList() : [];
    });
  }

  @override
  Future<void> insertPopularMovies(List<Movie> movies) async {
    Database db = await DBProvider.db.database;

    movies.forEach((movie) {
      db.insert(POPULAR_MOVIES_TABLE, movie.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  @override
  Future<void> insertTopRatedMovies(List<Movie> movies) async {
    Database db = await DBProvider.db.database;

    movies.forEach((movie) {
      db.insert(TOP_RATED_MOVIES_TABLE, movie.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }
}

abstract class IMoviesDao {
  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();

  Future<void> insertPopularMovies(List<Movie> movies);

  Future<void> insertTopRatedMovies(List<Movie> movies);
}
