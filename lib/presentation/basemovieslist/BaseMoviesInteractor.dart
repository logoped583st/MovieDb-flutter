import 'dart:async';
import 'dart:io';

import 'package:logopeds_movies/MVP/MVPInteractor.dart';
import 'package:logopeds_movies/networking/database/Database.dart';
import 'package:logopeds_movies/networking/repository/PopularMoviesApi.dart';
import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesIInteractor.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesPresenter.dart';

abstract class BaseMoviesInteractor
    extends MVPInteractor<BaseMoviesIInteractor> {
  int _page = 1;

  int getPage() => _page;

  MoviesRepository _moviesRepository = new PopularMovies();

  BaseMoviesInteractor(BaseMoviesPresenter presenter) : super(presenter);

  MoviesRepository getRepository() => _moviesRepository;

  Future<BaseResponse<Movie>> movieRequest();

  Future<BaseResponse<Movie>> loadMovies() async {
    Future<BaseResponse<Movie>> future;
    if (await checkConnection()) {
      future = movieRequest();
      _page++;
      BaseResponse<Movie> movies = await future;
      presenter().networkMovies(movies.result);
      DBProvider.db.insertMovies(movies.result);
    } else {
      List<Movie> movies = await DBProvider.db.getAllClients();
      presenter().networkMovies(movies);
    }

    return future;
  }

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future.value(true);
      }
    } on SocketException catch (_) {
      return Future.value(false);
    }
  }
}
