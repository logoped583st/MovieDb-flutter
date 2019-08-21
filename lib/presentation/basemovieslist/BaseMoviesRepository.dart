import 'dart:async';
import 'dart:io';

import 'package:logopeds_movies/MVP/MVPRepository.dart';
import 'package:logopeds_movies/networking/api/MoviesApi.dart';
import 'package:logopeds_movies/networking/database/MovieDAO.dart';
import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesPresenter.dart';
import 'package:logopeds_movies/presentation/basemovieslist/IBaseMoviesRepository.dart';

abstract class BaseMoviesRepository
    extends MVPRepository<IBaseMoviesRepository> {
  int _page = 1;

  int getPage() => _page;

  final IMoviesApi moviesApi = new MoviesApi();

  final IMoviesDao movieDao = MovieDao();

  Future<void> insertMovies(List<Movie> movies);

  Future<List<Movie>> getMoviesFromDb();

  BaseMoviesRepository(BaseMoviesPresenter presenter) : super(presenter);

  Future<BaseResponse<Movie>> movieRequest();

  Future<BaseResponse<Movie>> loadMovies() async {
    Future<BaseResponse<Movie>> future;
    if (await checkConnection()) {
      BaseResponse<Movie> movies = await movieRequest();
      _page++;
      await insertMovies(movies.result);
      presenter().networkMovies(movies.result);
    } else {
      List<Movie> movies = await getMoviesFromDb();
      presenter().databaseMovies(movies);
    }

    return future;
  }

  // ignore: missing_return
  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future.value(true);
      }
    } on Exception catch (_) {
      return Future.value(false);
    }
  }
}
