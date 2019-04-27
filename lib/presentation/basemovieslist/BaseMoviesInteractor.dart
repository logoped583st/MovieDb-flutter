import 'dart:async';

import 'package:logopeds_movies/MVP/MVPInteractor.dart';
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
    Future<BaseResponse<Movie>> future = movieRequest();
    _page++;
    BaseResponse<Movie> movies = await future;
    presenter().networkMovies(movies.result);
    return future;
  }
}
